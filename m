Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0334A2D1A1
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 00:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62C86E036;
	Tue, 28 May 2019 22:38:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05446E029
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 May 2019 22:38:40 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3305.namprd12.prod.outlook.com (20.179.106.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 22:38:38 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 22:38:38 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amdkfd: Implement queue priority controls for gfx9
Thread-Topic: [PATCH 3/3] drm/amdkfd: Implement queue priority controls for
 gfx9
Thread-Index: AQHVFaYWo9lzgpy8d02nYdn8WBvViQ==
Date: Tue, 28 May 2019 22:38:36 +0000
Message-ID: <20190528223811.13947-4-Felix.Kuehling@amd.com>
References: <20190528223811.13947-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190528223811.13947-1-Felix.Kuehling@amd.com>
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
x-ms-office365-filtering-correlation-id: 215e6ca9-7e2f-446a-2150-08d6e3bd3932
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3305; 
x-ms-traffictypediagnostic: DM6PR12MB3305:
x-microsoft-antispam-prvs: <DM6PR12MB3305A94A0E727F8A7CCDC866921E0@DM6PR12MB3305.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:324;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(136003)(366004)(376002)(189003)(199004)(3846002)(6116002)(2501003)(2906002)(6486002)(54906003)(8936002)(6506007)(86362001)(81166006)(50226002)(99286004)(81156014)(256004)(8676002)(72206003)(6436002)(14454004)(14444005)(71190400001)(386003)(71200400001)(52116002)(7736002)(305945005)(2351001)(102836004)(64756008)(5660300002)(36756003)(5640700003)(66066001)(316002)(478600001)(186003)(4326008)(476003)(486006)(68736007)(6512007)(446003)(53936002)(1076003)(73956011)(66476007)(66946007)(26005)(76176011)(66556008)(66446008)(25786009)(2616005)(11346002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3305;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FmqzAnBwWypOOnFm4IxVYtSYtWAFZuJmhffo447FRVxuA8oM+3nJ2avcuXEYI3eMY36zKKmbmGhdHtMBCYnc8OiDtc3piQf/8hw6qdAUZCgt7a0IazjDQC7D/rpKE4Ego4E1H4Wr6QsIkCUqZiuFJnXY/B/B3OlBEpHg5NbvXaUf4JQdBE7SRXPrsGmSwgTrJfuagp0s0Dz1J9U6G/EM/ZvC//FxKoyO2B3mYKLXRvpKketrUTudsgFbkAtCbz/6/PtNnRTGY4hc+1ZH7VMMj4syzJSdTjyc1Sy0cHJ4oq8JpZb6Qky052tYBqc2pcFHdtp8L4qX/HDRKUyFQrfTtt6rjr0bnlmOVM+QhMoE+NRloG6t7SJbVq30OYS6KTuHcsZ8E6FNMYBKIMCi9BV5DDcP9dCIEXrO2P1ssAIXsuU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 215e6ca9-7e2f-446a-2150-08d6e3bd3932
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 22:38:36.8963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3305
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH8ZTbiEjAgQQLj6XUBzW0CtNJuir+HIrJe+UsG+R7U=;
 b=A7naKBWBGomQ++/if8zdFlsKL1HQd/mwq2vC9RO3GhyY6WSuIcVWuWeKw9oFHUAxiW6uSMvZx2gpDT+zss2sKH1gLm+AumUAw/ZXY9kqcFjPuyCIWn9Jm/xK6PfM0MKqbV012LXWHhZYBAmtmvjsMcStIGxLF1JK401Dku0tN7o=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Cornwall,
 Jay" <Jay.Cornwall@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmF5IENvcm53YWxsIDxKYXkuQ29ybndhbGxAYW1kLmNvbT4NCg0KUG9ydGVkIGZyb20g
Z2Z4OCwgbm8gY2hhbmdlcyBpbiByZWdpc3RlciBzZXR1cC4NCg0KU2lnbmVkLW9mZi1ieTogSmF5
IENvcm53YWxsIDxKYXkuQ29ybndhbGxAYW1kLmNvbT4NClJldmlld2VkLWJ5OiBGZWxpeCBLdWVo
bGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhs
aW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX21xZF9tYW5hZ2VyX3Y5LmMgfCAxMCArKysrKysrLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92OS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3Y5LmMNCmluZGV4IGE2NWVmY2EzNjIxNy4u
ODE4OTQ0YjUyZTExIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X21xZF9tYW5hZ2VyX3Y5LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9t
cWRfbWFuYWdlcl92OS5jDQpAQCAtNjcsNiArNjcsMTIgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2N1
X21hc2soc3RydWN0IG1xZF9tYW5hZ2VyICptbSwgdm9pZCAqbXFkLA0KIAkJbS0+Y29tcHV0ZV9z
dGF0aWNfdGhyZWFkX21nbXRfc2UzKTsNCiB9DQogDQorc3RhdGljIHZvaWQgc2V0X3ByaW9yaXR5
KHN0cnVjdCB2OV9tcWQgKm0sIHN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzICpxKQ0KK3sNCisJbS0+
Y3BfaHFkX3BpcGVfcHJpb3JpdHkgPSBwaXBlX3ByaW9yaXR5X21hcFtxLT5wcmlvcml0eV07DQor
CW0tPmNwX2hxZF9xdWV1ZV9wcmlvcml0eSA9IHEtPnByaW9yaXR5Ow0KK30NCisNCiBzdGF0aWMg
c3RydWN0IGtmZF9tZW1fb2JqICphbGxvY2F0ZV9tcWQoc3RydWN0IGtmZF9kZXYgKmtmZCwNCiAJ
CXN0cnVjdCBxdWV1ZV9wcm9wZXJ0aWVzICpxKQ0KIHsNCkBAIC0xNDEsOSArMTQ3LDYgQEAgc3Rh
dGljIGludCBpbml0X21xZChzdHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2b2lkICoqbXFkLA0KIAkJ
CTEgPDwgQ1BfSFFEX1FVQU5UVU1fX1FVQU5UVU1fU0NBTEVfX1NISUZUIHwNCiAJCQkxMCA8PCBD
UF9IUURfUVVBTlRVTV9fUVVBTlRVTV9EVVJBVElPTl9fU0hJRlQ7DQogDQotCW0tPmNwX2hxZF9w
aXBlX3ByaW9yaXR5ID0gMTsNCi0JbS0+Y3BfaHFkX3F1ZXVlX3ByaW9yaXR5ID0gMTU7DQotDQog
CWlmIChxLT5mb3JtYXQgPT0gS0ZEX1FVRVVFX0ZPUk1BVF9BUUwpIHsNCiAJCW0tPmNwX2hxZF9h
cWxfY29udHJvbCA9DQogCQkJMSA8PCBDUF9IUURfQVFMX0NPTlRST0xfX0NPTlRST0wwX19TSElG
VDsNCkBAIC0yNDYsNiArMjQ5LDcgQEAgc3RhdGljIGludCB1cGRhdGVfbXFkKHN0cnVjdCBtcWRf
bWFuYWdlciAqbW0sIHZvaWQgKm1xZCwNCiAJCW0tPmNwX2hxZF9jdHhfc2F2ZV9jb250cm9sID0g
MDsNCiANCiAJdXBkYXRlX2N1X21hc2sobW0sIG1xZCwgcSk7DQorCXNldF9wcmlvcml0eShtLCBx
KTsNCiANCiAJcS0+aXNfYWN0aXZlID0gUVVFVUVfSVNfQUNUSVZFKCpxKTsNCiANCi0tIA0KMi4x
Ny4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
