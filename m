Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CA73D213
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 18:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E9F8922B;
	Tue, 11 Jun 2019 16:20:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700053.outbound.protection.outlook.com [40.107.70.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D90D8922A
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 16:20:30 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2450.namprd12.prod.outlook.com (52.132.11.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Tue, 11 Jun 2019 16:20:28 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1965.017; Tue, 11 Jun 2019
 16:20:28 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Reserve space for shared fence
Thread-Topic: [PATCH] drm/amdgpu: Reserve space for shared fence
Thread-Index: AQHVIHGVDF0QWw0aYE6HvPgIR4imPQ==
Date: Tue, 11 Jun 2019 16:20:28 +0000
Message-ID: <1560270022-4934-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::26) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f908e9d6-3dc5-46e0-b123-08d6ee88b77c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR12MB2450; 
x-ms-traffictypediagnostic: BL0PR12MB2450:
x-microsoft-antispam-prvs: <BL0PR12MB245031802E3CDA8A6EF99C9C80ED0@BL0PR12MB2450.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(396003)(136003)(346002)(199004)(189003)(54906003)(102836004)(6436002)(26005)(7736002)(52116002)(186003)(6486002)(316002)(36756003)(5640700003)(2616005)(72206003)(6506007)(386003)(2906002)(476003)(305945005)(14444005)(256004)(2501003)(14454004)(6916009)(68736007)(86362001)(3846002)(5660300002)(478600001)(81166006)(25786009)(6512007)(81156014)(8936002)(6116002)(8676002)(53936002)(486006)(99286004)(4326008)(73956011)(66446008)(64756008)(66556008)(66476007)(71200400001)(66946007)(71190400001)(50226002)(2351001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2450;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DPm9Mv0jn9YAFh5z8Jo71OI7ds34Eq0lr7hu5efctCCP0hZvBNY3WZa+WYTwmHxtNBwK0lbTP2od+EdGEjnr5l2JZmfRvlIvXCO4hSQ88LgpElduljnOVSmlsVrw1dBrSD2ZjOiFpN7lDyiv0HjHA83tPtK6p3/zbt4mcA7nEfFTvA5wt+Nub15pOeoIHkdXaYJyDe7wghFFS5US0P+1jFaoVbaWpmu6QPFM56LgP+tAKarsxM9d/H1LQp2fsFjBX36/zC8ZL6D0ESZ5wieG9j9r48nTgl1yakImpyLDEfC6sWigxED2Ex1smNJ0na4cCR7kr5/cXRugDop5ipXQBtkhoGwBf2TvRuhbV/B4yFguPg6WBpfWnB6kpcDEygLnhLg8tk5JaCoDYRilW3uEswyPj6PeZBajlH0bhEYVVVM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f908e9d6-3dc5-46e0-b123-08d6ee88b77c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 16:20:28.3817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2450
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy91ii8IAkfZr3ZH/h/iJFKYdWRim0mPoXQChPKw168=;
 b=M9hB5YWsjkXtvlZqNNQF+847zN3BRSCLg4eG3FsuwS0W9bgnAT0zrECQ6bkFRtp/08D9aGUGRk5gXQXJiIF3me4OCYjZQdbncLJXjxBXX3Od4tiNnnp8ckg9XqXyrXHlytdpebLicACx8BQZMUkaB4suL4iwNdEm2lGnmzN38Qs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2FsbCByZXNlcnZhdGlvbl9vYmplY3RfcmVzZXJ2ZV9zaGFyZWQgdG8gcmVzZXJ2ZQ0Kc3BhY2Ug
Zm9yIHNoYXJlZCBmZW5jZS4gT3RoZXJ3aXNlIGl0IHdpbGwgdHJpZ2dlcg0KQlVHX09OIGNvbmRp
dGlvbiBpbiByZXNlcnZhdGlvbl9vYmplY3RfYWRkX3NoYXJlZF9mZW5jZS4NCg0KQ2hhbmdlLUlk
OiBJYjBmYWUxNjI0N2UzM2VlNjhmOTViZmZhNzIzNDUxYzBjZDYxOTM0NA0KU2lnbmVkLW9mZi1i
eTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dwdXZtLmMNCmluZGV4IDgxZTBlNzUuLjc0ZTg2OTUgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMNCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KQEAgLTIxNTIs
MTIgKzIxNTIsMTYgQEAgaW50IGFtZGdwdV9hbWRrZmRfYWRkX2d3c190b19wcm9jZXNzKHZvaWQg
KmluZm8sIHZvaWQgKmd3cywgc3RydWN0IGtnZF9tZW0gKiptZW0NCiAJICogQWRkIHByb2Nlc3Mg
ZXZpY3Rpb24gZmVuY2UgdG8gYm8gc28gdGhleSBjYW4NCiAJICogZXZpY3QgZWFjaCBvdGhlci4N
CiAJICovDQorCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChnd3NfYm8t
PnRiby5yZXN2LCAxKTsNCisJaWYgKHJldCkNCisJCWdvdG8gcmVzZXJ2ZV9zaGFyZWRfZmFpbDsN
CiAJYW1kZ3B1X2JvX2ZlbmNlKGd3c19ibywgJnByb2Nlc3NfaW5mby0+ZXZpY3Rpb25fZmVuY2Ut
PmJhc2UsIHRydWUpOw0KIAlhbWRncHVfYm9fdW5yZXNlcnZlKGd3c19ibyk7DQogCW11dGV4X3Vu
bG9jaygmKCptZW0pLT5wcm9jZXNzX2luZm8tPmxvY2spOw0KIA0KIAlyZXR1cm4gcmV0Ow0KIA0K
K3Jlc2VydmVfc2hhcmVkX2ZhaWw6DQogYm9fdmFsaWRhdGlvbl9mYWlsdXJlOg0KIAlhbWRncHVf
Ym9fdW5yZXNlcnZlKGd3c19ibyk7DQogYm9fcmVzZXJ2YXRpb25fZmFpbHVyZToNCi0tIA0KMi43
LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
