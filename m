Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 250EE2D587
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 08:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36FA6E0EC;
	Wed, 29 May 2019 06:32:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750080.outbound.protection.outlook.com [40.107.75.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2834E6E0EC
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 06:32:16 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3711.namprd12.prod.outlook.com (10.255.236.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Wed, 29 May 2019 06:32:14 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 06:32:14 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: [PATCH 1/3] drm/amdgpu: add field indicating if has PCIE atomics
 support
Thread-Topic: [PATCH 1/3] drm/amdgpu: add field indicating if has PCIE atomics
 support
Thread-Index: AQHVFehAI+BiDxTOO0KpwypB49J4Vw==
Date: Wed, 29 May 2019 06:32:14 +0000
Message-ID: <1559111516-21940-2-git-send-email-Jack.Xiao@amd.com>
References: <1559111516-21940-1-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1559111516-21940-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:203:2e::21) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d17a9a3d-eac4-4e7d-1616-08d6e3ff6322
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3711; 
x-ms-traffictypediagnostic: MN2PR12MB3711:
x-microsoft-antispam-prvs: <MN2PR12MB371138F3ED304B7153B38725EF1F0@MN2PR12MB3711.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(346002)(376002)(366004)(39860400002)(199004)(189003)(66446008)(72206003)(64756008)(2906002)(68736007)(3846002)(6116002)(14454004)(2501003)(478600001)(66556008)(66476007)(66946007)(73956011)(6636002)(7736002)(4326008)(8676002)(476003)(2616005)(25786009)(305945005)(11346002)(446003)(486006)(71200400001)(71190400001)(386003)(66066001)(6506007)(186003)(8936002)(50226002)(5660300002)(110136005)(6512007)(102836004)(26005)(4744005)(81166006)(81156014)(6486002)(6436002)(76176011)(99286004)(86362001)(52116002)(256004)(53936002)(36756003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3711;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ja6I9JN4UZyq2a5fcfja/xo0vxZ2HHo8JSJuQqLL4CbT0D15sfoGYAl95jtlS2gnN7wcWAf9qRzKQOpBsLo3qrQP1VzRC7ZiULZYfm6396HC6Sn1FLGYEdjx1JiSQUwe9JwdVkpET1s+4nb7zhjebJ3VlC07PwwUm+xd80Jx/P+uuSheKO45qwJkv8cRKoMCKkrr1dEH/xwlCGLkTuZU6/d9xGfGiaTIZcfVpo4HlqMSnh0tAfZRgUFOcatC7Pu1afxvthwJ20mlHJOMY+xEOy64gZ0vE+H306gTD7XSkTQf+PlVqMav1aY0aT/prn0Smp5VEIrYtV5YVFaB9+EOkdTdLbvi6avn0TaNG8GloaHMwJDkzGAdtlDV5zmCj2j05Q03kYxpwfkoSs9kRkiFEThVK8mhTiH0jZAHagzfQrk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17a9a3d-eac4-4e7d-1616-08d6e3ff6322
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 06:32:14.3225 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3711
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5fsQJTKkwpmv5jzNm0Cd2FFa58eZB7lqLWeab2BGG0=;
 b=GfUGCNYCGfQAyhkxmVuI3rHF5WbBzaKyIqecSjtr3OO1CnSN1iix4JFzXc0/+fZfOR/EN6meLScbvZ5cc/Dfjbc3Zqbh0lm2fPHqFG0wbLfZ0fSo8m1Gns6tc/hc4mQLTIOl+gngX1g7mGhNyroD9/uHKovIysIg0ueufH+KRRY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIG5ldyBmaWVsZCBpbiBhbWRncHUgZGV2aWNlIGlzIHVzZWQgdG8gcmVjb3JkIHdoZXRoZXIg
dGhlDQpzeXN0ZW0gaGFzIFBDSUUgYXRvbWljcyBzdXBwb3J0LiBUaGUgZmllbGQgY2FuIGJlIGV4
cG9zZWQgdG8NClVNRCBvciBrZmQgd2hldGhlciBQQ0lFIGF0b21pY3MgaGF2ZSBzdXBwb3J0ZWQu
DQoNClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+DQotLS0NCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCB8IDEgKw0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KaW5kZXgg
ZDM1NWU5YS4uYjBhMDFlNCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdS5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KQEAg
LTc2Nyw2ICs3NjcsNyBAQCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSB7DQogCXN0cnVjdCBtdXRleCAg
ICAgICAgICAgICAgICAgICAgZ3JibV9pZHhfbXV0ZXg7DQogCXN0cnVjdCBkZXZfcG1fZG9tYWlu
CQl2Z2FfcG1fZG9tYWluOw0KIAlib29sCQkJCWhhdmVfZGlzcF9wb3dlcl9yZWY7DQorCWJvb2wg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaGF2ZV9hdG9taWNzX3N1cHBvcnQ7DQogDQogCS8q
IEJJT1MgKi8NCiAJYm9vbAkJCQlpc19hdG9tX2Z3Ow0KLS0gDQoxLjkuMQ0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
