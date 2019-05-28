Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF362D1A7
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 00:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662406E03A;
	Tue, 28 May 2019 22:44:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680088.outbound.protection.outlook.com [40.107.68.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AF389F85
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 22:44:41 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3244.namprd12.prod.outlook.com (20.179.105.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 22:44:36 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 22:44:36 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] mm/hmm.c: only set FAULT_FLAG_ALLOW_RETRY for non-blocking
Thread-Topic: [PATCH 2/2] mm/hmm.c: only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Index: AQHVFabsbAyjZW6E7kWnWW5Csv/aSw==
Date: Tue, 28 May 2019 22:44:36 +0000
Message-ID: <20190528224419.14124-3-Felix.Kuehling@amd.com>
References: <20190528224419.14124-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190528224419.14124-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3209045-4ce4-4d66-f189-08d6e3be0f48
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3244; 
x-ms-traffictypediagnostic: DM6PR12MB3244:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3244616C66DB4A3E9A03F352921E0@DM6PR12MB3244.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(199004)(189003)(73956011)(66476007)(305945005)(5640700003)(66556008)(53936002)(186003)(316002)(64756008)(66946007)(81166006)(81156014)(66446008)(6916009)(71190400001)(8676002)(68736007)(7736002)(50226002)(6436002)(966005)(71200400001)(1076003)(36756003)(2906002)(72206003)(14454004)(86362001)(478600001)(66574012)(5660300002)(25786009)(446003)(52116002)(6506007)(76176011)(6486002)(11346002)(386003)(2616005)(14444005)(6512007)(2351001)(99286004)(8936002)(26005)(2501003)(476003)(486006)(66066001)(3846002)(6306002)(102836004)(6116002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3244;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5ZV/9FgNoNaBn6ve4JQZZuBU2J8sQY07INu2iZjEVBch/X5n5HBjYCwA7P9bLGN9PvqC4dfrXI3d+ypIe1Xm1HMqfhMtdRx9htZzkrm+XBAaziixTzsuW3DPdDZSn+GXQRjtNaAehnGZjVPfrSWbFFDM2XiHdkC2GSMN+qN+tAyaomLf6XDhVsEL5qtSaBNTSgXUJWYQkZlSTJsCjxxygNYoPfVrQsAGy/6KgcWLlVZQKgHF1FX+3+uISL+C7OYChY7UnFFzpeiS5On/DkjG7XK2Vd6lYz/4SMQg0+J2mVQ/EBRv+i7ODTOJ8wubUl7ATQc5tN4JNbpPLzrcrSx36TJCoRB5X5w+Fua6T3FZoMdYwYuG7H1EjG6nl2tpran0UWP1HY9pxD/IsEd4sNzRLdXXzmPVcbS9EJQiHyh69Ec=
Content-ID: <30C829BF335ACC4C8C69D7F3213EDDFB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3209045-4ce4-4d66-f189-08d6e3be0f48
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 22:44:36.1532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2W32hM02d8eNur2qQbJtEKsuP/v0qsMKBkKMORUgyI=;
 b=mfw+MH5gXnoF9EVD0t9ljnv0J6dg7wymAMv/dR6cijbuwYIXQKOo6sPRkEtIJmvpSC2uE1FaGvmV0tp4eO4Y0jixjUuKRk+Oc3DYMcQDe/JZnzpmQhdJSCq92/9wWtjMO8eUpMjxZ2iwgH6HXamK+68jAOvIrKqEcFRzZ0ashwI=
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

RnJvbTogIkt1ZWhsaW5nLCBGZWxpeCIgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQoNCkRvbid0
IHNldCB0aGlzIGZsYWcgYnkgZGVmYXVsdCBpbiBobW1fdm1hX2RvX2ZhdWx0LiBJdCBpcyBzZXQN
CmNvbmRpdGlvbmFsbHkganVzdCBhIGZldyBsaW5lcyBiZWxvdy4gU2V0dGluZyBpdCB1bmNvbmRp
dGlvbmFsbHkNCmNhbiBsZWFkIHRvIGhhbmRsZV9tbV9mYXVsdCBkb2luZyBhIG5vbi1ibG9ja2lu
ZyBmYXVsdCwgcmV0dXJuaW5nDQotRUJVU1kgYW5kIHVubG9ja2luZyBtbWFwX3NlbSB1bmV4cGVj
dGVkbHkuDQoNCkxpbms6IGh0dHA6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDE5MDUxMDE5NTI1OC45
OTMwLTMtRmVsaXguS3VlaGxpbmdAYW1kLmNvbQ0KU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxp
bmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQpSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3Nl
IDxqZ2xpc3NlQHJlZGhhdC5jb20+DQpDYzogQWxleCBEZXVjaGVyIDxhbGV4LmRldWNoZXJAYW1k
LmNvbT4NCkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KLS0tDQogbW0vaG1t
LmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQoNCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jDQppbmRleCA1OTlkOGU4MmRiNjcu
LjAxOGNiNWMyNDFhNiAxMDA2NDQNCi0tLSBhL21tL2htbS5jDQorKysgYi9tbS9obW0uYw0KQEAg
LTMzOSw3ICszMzksNyBAQCBzdHJ1Y3QgaG1tX3ZtYV93YWxrIHsNCiBzdGF0aWMgaW50IGhtbV92
bWFfZG9fZmF1bHQoc3RydWN0IG1tX3dhbGsgKndhbGssIHVuc2lnbmVkIGxvbmcgYWRkciwNCiAJ
CQkgICAgYm9vbCB3cml0ZV9mYXVsdCwgdWludDY0X3QgKnBmbikNCiB7DQotCXVuc2lnbmVkIGlu
dCBmbGFncyA9IEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkgfCBGQVVMVF9GTEFHX1JFTU9URTsNCisJ
dW5zaWduZWQgaW50IGZsYWdzID0gRkFVTFRfRkxBR19SRU1PVEU7DQogCXN0cnVjdCBobW1fdm1h
X3dhbGsgKmhtbV92bWFfd2FsayA9IHdhbGstPnByaXZhdGU7DQogCXN0cnVjdCBobW1fcmFuZ2Ug
KnJhbmdlID0gaG1tX3ZtYV93YWxrLT5yYW5nZTsNCiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEgPSB3YWxrLT52bWE7DQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
