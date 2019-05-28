Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EEB2D19F
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 00:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B1D89F77;
	Tue, 28 May 2019 22:38:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED48589F77
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 22:38:39 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3305.namprd12.prod.outlook.com (20.179.106.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 22:38:35 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 22:38:35 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/3] KFD upstreaming
Thread-Topic: [PATCH 0/3] KFD upstreaming
Thread-Index: AQHVFaYW50z+q2Kp5UWxtAs9xJtrew==
Date: Tue, 28 May 2019 22:38:35 +0000
Message-ID: <20190528223811.13947-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bacb959-85ad-4267-b07d-08d6e3bd3878
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3305; 
x-ms-traffictypediagnostic: DM6PR12MB3305:
x-microsoft-antispam-prvs: <DM6PR12MB33055375246239141425BDDD921E0@DM6PR12MB3305.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(136003)(366004)(376002)(189003)(199004)(3846002)(6116002)(2501003)(2906002)(6486002)(8936002)(6506007)(86362001)(81166006)(50226002)(99286004)(81156014)(256004)(8676002)(72206003)(6436002)(14454004)(71190400001)(386003)(71200400001)(52116002)(7736002)(305945005)(2351001)(102836004)(64756008)(5660300002)(36756003)(5640700003)(66066001)(316002)(4744005)(478600001)(186003)(4326008)(476003)(486006)(68736007)(6512007)(53936002)(1076003)(73956011)(66476007)(66946007)(26005)(66556008)(66446008)(25786009)(2616005)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3305;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pBpCLWTXanv0rm0pjowV0Z5TllhOtCl41BJA8ngn+GclBdYiwu1Es61zeuBK8p+dxGnnQwrbpZLZUPGTQQvYx9ma0R+EeJXqQKEHqlFdT3i1GYqPmthG5smy/RCjOFULvz7r3+rR/j34t2o2gz5n2x11/lp0H5KcBSrTVwyL3nu45R63f1jYLsBQcRN5PanFDypyL6CGMJ7Sh/e/puONiEaKUBA2DmwLe2OiP5fTVEUQkXrkTsqJQ0JnEMGYu+Qr1JHhGS2/S4xJRnVDzbIKFhqJ2uN382FkLkaR7E2zqmXsIy5WjiJk8zi/xH5qKA+rH14EdFlL2UlZoCxHeBtDJ6mIXYv7b4u3cag0SmvsDObTc9dmWLxd2ZFEA2zKJz9gltrsIxHKq18oU3UbxLNPzkyLz5ImOiKt6wf58UAnp/I=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bacb959-85ad-4267-b07d-08d6e3bd3878
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 22:38:35.7560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7ouAUP/B6RTYE7v6nLmVuCA71C7ngKCLjuABaffG9M=;
 b=SyBfD+jdnRBc9Nt2OX0KDXdby9QFpP92QGMIVzGfRiknE+t3r2tCNCE2yiwY2e+n36UEJ7Yplk8BSmgHuhJ1MPaLD74+j8nP8WtdqAeZh8AuhCRejG+LgaVv81AO4zcSM/cuI3rMYjRh0ovS/WaQ9Fh0iXhpS9q7crFuyhGZNqc=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TmV3IGZlYXR1cmU6IHF1ZXVlIHByaW9yaXRpZXMNCg0KVGhlIGV2aWN0aW9uIHN0YXRlIGxvZ2lj
IGNoYW5nZSBpcyBwcmVwYXJhdGlvbiBmb3Igc29tZSBkZWJ1Z2dlciBzdXBwb3J0DQp3ZSdyZSB3
b3JraW5nIG9uIGJ1dCBoYXZlbid0IHNldHRsZWQgb24gdGhlIGZpbmFsIEFCSSB5ZXQuDQoNCkZl
bGl4IEt1ZWhsaW5nICgxKToNCiAgZHJtL2FtZGtmZDogU2ltcGxpZnkgZXZpY3Rpb24gc3RhdGUg
bG9naWMNCg0KSmF5IENvcm53YWxsICgxKToNCiAgZHJtL2FtZGtmZDogSW1wbGVtZW50IHF1ZXVl
IHByaW9yaXR5IGNvbnRyb2xzIGZvciBnZng5DQoNCm96ZW5nICgxKToNCiAgZHJtL2FtZGtmZDog
Q1AgcXVldWUgcHJpb3JpdHkgY29udHJvbHMNCg0KIC4uLi9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlX3F1ZXVlX21hbmFnZXIuYyB8IDg0ICsrKysrKysrKystLS0tLS0tLS0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXIuYyAgfCAyMCArKysrKw0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlci5oICB8ICAyICstDQogLi4uL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfY2lrLmMgIHwgMjcgKysrLS0tDQogLi4uL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjkuYyAgIHwgMjAgKystLS0NCiAuLi4v
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92aS5jICAgfCAyMiArKy0tLQ0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcml2LmggICAgICAgICB8IDE2ICsrKysNCiA3
IGZpbGVzIGNoYW5nZWQsIDExMyBpbnNlcnRpb25zKCspLCA3OCBkZWxldGlvbnMoLSkNCg0KLS0g
DQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
