USE tifosi;

SET FOREIGN_KEY_CHECKS = 0;

-- 1. INsertion des marques depuis marque.xlsx
INSERT INTO marque (id_marque, nom_marque) VALUES
(1, 'Coca-Cola'),
(2, 'Pepsico'),
(3, 'Oasis'),
(4, 'Cristaline');

-- 2. Insertion des boissons depuis boisson.xlsx
INSERT INTO boisson (id_boisson, nom_boisson, id_marque) VALUES
(1, 'Coca-Cola zéro', 1),
(2, 'Coca-Cola original', 1),
(3, 'Pepsi', 2),
(4, 'Lipton Ice Tea', 2),
(5, 'Oasis tropical', 3),
(6, 'Eau plate', 4);

-- 3. Insertion des ingrédients depuis ingredient.xlsx
INSERT INTO ingredient (id_ingredient, nom_ingredient) VALUES
(1, 'Ail'),
(2, 'Ananas'),
(3, 'Artichaut'),
(4, 'Bacon'),
(5, 'Base tomate'),
(6, 'Base crème'),
(7, 'Champignon'),
(8, 'Chèvre'),
(9, 'Cresson'),
(10, 'Emmental'),
(11, 'Gorgonzola'),
(12, 'Jambon cuit'),
(13, 'Jambon fumé'),
(14, 'Oeuf'),
(15, 'Oignon'),
(16, 'Olive noire'),
(17, 'Olive verte'),
(18, 'Parmesan'),
(19, 'Piment'),
(20, 'Poivron'),
(21, 'Pomme de terre'),
(22, 'Raclette'),
(23, 'Salami'),
(24, 'Saumon'),
(25, 'Tomate cerise'),
(26, 'Mozzarella');

-- 4. Insertion des focaccias depuis focaccia.xlsx
INSERT INTO focaccia (id_focaccia, nom_focaccia, prix_focaccia, cnt_focaccia) VALUES
(1, 'Mozza', 9.50, 'Base tomate, mozzarella, origan'),
(2, 'Gorgonzola', 11.00, 'Base crème, gorgonzola, noix'),
(3, 'Campione', 12.00, 'Base tomate, mozzarella, champignons, jambon fumé'),
(4, 'Bambino', 9.00, 'Base tomate, mozzarella, jambon cuit, emmental'),
(5, 'Capra', 11.50, 'Base crème, chèvre, miel, cresson');

-- 5. Assication focaccia et ingredient (table comprendre)
INSERT INTO comprendre (id_focaccia, id_ingredient) VALUES
(1, 5), (1, 26),
(2, 6), (2, 11),
(3, 5), (3, 26), (3, 7), (3, 13),
(4, 5), (4, 26), (4, 12), (4, 10),
(5, 6), (5, 8), (5, 9);

-- 6. Insertion de clients (données de test)
INSERT INTO client (id_client, nom_client, age, cp) VALUES
(1, 'Dupont', 28, 75001),
(2, 'Martin', 35, 69002),
(3, 'Bernard', 42, 13001);

-- 7. Achats de focaccia (Table paye)
INSERT INTO achete (id_client, id_focaccia, jour) VALUES
(1, 1, '2026-06-01'),
(2, 3, '2026-06-02'),
(3, 5, '2026-06-03');

-- 8. Achats de boisson (table paye)
INSERT INTO paye (id_client, id_boisson, jour) VALUES
(1, 1, '2026-06-01'),
(2, 3, '2026-06-02'),
(3, 5, '2026-06-03');

SET FOREIGN_KEY_CHECKS = 1;