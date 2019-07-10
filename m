Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6370263FB7
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 05:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EBB899BE;
	Wed, 10 Jul 2019 03:59:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780057.outbound.protection.outlook.com [40.107.78.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3438899B0
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 03:59:13 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3001.namprd12.prod.outlook.com (20.178.29.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 10 Jul 2019 03:59:08 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 03:59:08 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amdgpu: Add flag to wipe VRAM on release
Thread-Topic: [PATCH 1/5] drm/amdgpu: Add flag to wipe VRAM on release
Thread-Index: AQHVNtPTRhYqlcsJC0GOeDe9oQ8zWg==
Date: Wed, 10 Jul 2019 03:59:08 +0000
Message-ID: <20190710035848.26966-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a69f113-201e-4d4d-2c9b-08d704eaf567
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3001; 
x-ms-traffictypediagnostic: DM6PR12MB3001:
x-microsoft-antispam-prvs: <DM6PR12MB3001F5C8480603F46152C7A492F00@DM6PR12MB3001.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(189003)(199004)(86362001)(52116002)(68736007)(36756003)(2501003)(53936002)(71190400001)(71200400001)(66946007)(66556008)(6916009)(66446008)(64756008)(66476007)(6512007)(2351001)(3846002)(6116002)(316002)(99286004)(478600001)(2906002)(6486002)(50226002)(14454004)(25786009)(4744005)(1076003)(5660300002)(26005)(476003)(186003)(486006)(2616005)(5640700003)(305945005)(7736002)(6436002)(102836004)(6506007)(81156014)(8936002)(81166006)(386003)(8676002)(256004)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3001;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lXJryGBQISwmu84UdGJF7eJt7EB7gUSkgnjNY0QO17KF7IXkEuZzST+ELFesqS8o67oeMnay6XIsDefuQOLW27PY/8doESzCbbYtCZzdmtPjsMvZ6/rUPiCi/fzdTj98A380fK8jFJyYB4qVHw1V6Uyr3Fpo8L6eLzqhfNZmmYfCD8tSaqeyvDYMJEXSKDTXYdd2QDbTcMvZ5f1jO6/LN7Eq9HPBiG9jDo7v4tuW9yvKHFiGxQiQpDclKTENfy1o8X1msvIVIimAko0VupYyOOf+w5qudqMUAzJJNO99+x9Upr9mEMuvh13VnpKsFoHh02eJzgOKmD4GyYgjwLPCwB5WbP1tIea9mofa5tI8cc8uG9tJDkNTFefeRD2LXvPFbF7bAwC1afAaubJiNKESKRzX6twfeKRZDmESJ3TDqoc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a69f113-201e-4d4d-2c9b-08d704eaf567
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 03:59:08.4181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9J+OctimPeNHphmkUy+sj8+XzCnLsgqebt1TWbW+LGw=;
 b=LjkjL6XY7ntaiHzUco3BLAFHZ3H4mN8t8WrzgVK5gGWRbKHYc0tnc5DkzPy3X0ovmc1V39E30lIVaQ8IhoXa9S+e/aCaAB2Fn5Z3uL3zwH3Hl6fwTp4q0bMPQJ5f7qgm58RPJIdQ0x5aJJ1tHgy+d6vZMZVUWISbWaaAAxXWFv0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBtZW1vcnkgYWxsb2NhdGlvbiBmbGFnIHdpbGwgYmUgdXNlZCB0byBpbmRpY2F0ZSBCT3Mg
Y29udGFpbmluZwpzZW5zaXRpdmUgZGF0YSB0aGF0IHNob3VsZCBub3QgYmUgbGVha2VkIHRvIG90
aGVyIHByb2Nlc3Nlcy4KClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPgotLS0KIGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oIHwgNCArKysr
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91
YXBpL2RybS9hbWRncHVfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAppbmRl
eCA2MTg3MDQ3OGJjOWMuLmRjMzQyOGIzMjVhZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2Ry
bS9hbWRncHVfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKQEAgLTEz
MSw2ICsxMzEsMTAgQEAgZXh0ZXJuICJDIiB7CiAgKiBmb3IgdGhlIHNlY29uZCBwYWdlIG9ud2Fy
ZCBzaG91bGQgYmUgc2V0IHRvIE5DLgogICovCiAjZGVmaW5lIEFNREdQVV9HRU1fQ1JFQVRFX01R
RF9HRlg5CQkoMSA8PCA4KQorLyogRmxhZyB0aGF0IEJPIG1heSBjb250YWluIHNlbnNpdGl2ZSBk
YXRhIHRoYXQgbXVzdCBiZSB3aXBlZCBiZWZvcmUKKyAqIHJlbGVhc2luZyB0aGUgbWVtb3J5Cisg
Ki8KKyNkZWZpbmUgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9XSVBFX09OX1JFTEVBU0UJKDEgPDwg
OSkKIAogc3RydWN0IGRybV9hbWRncHVfZ2VtX2NyZWF0ZV9pbiAgewogCS8qKiB0aGUgcmVxdWVz
dGVkIG1lbW9yeSBzaXplICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
