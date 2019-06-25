Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959A85534E
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 17:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB4C6E14C;
	Tue, 25 Jun 2019 15:26:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700066.outbound.protection.outlook.com [40.107.70.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729136E14C
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 15:26:37 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1899.namprd12.prod.outlook.com (10.175.91.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 15:26:33 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa%9]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 15:26:33 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu/display: switch udelay to msleep
Thread-Topic: [PATCH 2/2] drm/amdgpu/display: switch udelay to msleep
Thread-Index: AQHVK14dpX6edAoFYkmf3qZoWfkK+KasfeAA
Date: Tue, 25 Jun 2019 15:26:33 +0000
Message-ID: <DM5PR12MB14181D3021203713DFA178D2FCE30@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190625135830.26173-1-alexander.deucher@amd.com>
 <20190625135830.26173-2-alexander.deucher@amd.com>
In-Reply-To: <20190625135830.26173-2-alexander.deucher@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9bf8593d-0e82-428f-94de-08d6f9818188
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1899; 
x-ms-traffictypediagnostic: DM5PR12MB1899:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1899A60DC0F6782176B8173DFCE30@DM5PR12MB1899.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(376002)(366004)(396003)(199004)(189003)(13464003)(66556008)(4326008)(66946007)(66446008)(3846002)(52536014)(6116002)(25786009)(66476007)(2501003)(5660300002)(73956011)(76116006)(64756008)(316002)(110136005)(71200400001)(71190400001)(66066001)(8936002)(53936002)(229853002)(9686003)(55016002)(6306002)(6436002)(6246003)(6506007)(33656002)(102836004)(72206003)(74316002)(7696005)(76176011)(966005)(53546011)(26005)(186003)(68736007)(305945005)(81166006)(81156014)(8676002)(7736002)(14454004)(99286004)(478600001)(2906002)(14444005)(256004)(11346002)(446003)(476003)(86362001)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1899;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jg3JpKCLPZ6LYeHaMYYB0cutTAsHuqijWWuyMnF71o7WsWx+kHhwRhkEqtf/xXv5JhL6oWmsS5uxQ3plZUnmbxyS9tt94ojSpPRiHZikKNKzD9lZvW/fQ1kwBfGpua5GtuRQUpRuBGScXE0bFhDT6AiH1BWT+7+GsQ7emyYwYqzLXuNfHy1QDxkYVtQMda5v/PR9yp1HUCaiLTpsVTBw77akwitw5NFOwTrj+Q5PbogeM+2RBJ7mDdLtazZDm/eRVFwuwrbRmqRS/Z7HvpSWlXBtH6rm1wE/MCVFo2Urylr3kJBkNG/LbYCQil9Bw5IY0CZuE6dRco3vt/XG8KfwZ+1Nf6cTVJLTywAsW5evlVo34NdqhWrryVF7liop3YJ1EQCK8yaJmpxpkD5EWZVeycVh/t2zcSiVTLbLZmzJBn4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf8593d-0e82-428f-94de-08d6f9818188
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 15:26:33.7642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFBt3TVdO6/d38aMRAGm10YtJn7C631uYr6DDPeqe30=;
 b=vdVd+P503SF2S/eL1jHGiPIFyX3kSQBX7JvCAxGGUSNbhmqagzFM6L2JqaVdF9yNVYuFf1k2bNTR0mQ8uMCWsEk4sgtR7u3qQ0t3uIdhZF4k3RX2m3ybsDxeGbOMEW1TDE3kEmTDzYzVPORByNaDmPy/yc/bhQQrN5U0/AatJdI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzIFJldmlld2VkLWJ5OiBIYXdraW5nIFpoYW5nIDxIYXdraW5nLlpoYW5nQGFtZC5j
b20+DQoNClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmIE9mIEFsZXggRGV1Y2hlcg0KU2VudDogMjAxOeW5tDbmnIgyNeaXpSAyMTo1OQ0KVG86IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDIvMl0gZHJtL2FtZGdwdS9k
aXNwbGF5OiBzd2l0Y2ggdWRlbGF5IHRvIG1zbGVlcA0KDQpXZSBtYXkgbmVlZCB0byBzbGVlcCBm
b3IgdXAgdG8gODBtczoNCg0KLyogRmlyc3QgRFBDRCByZWFkIGFmdGVyIFZERCBPTiBjYW4gZmFp
bCBpZiB0aGUgcGFydGljdWxhciBib2FyZA0KICogZG9lcyBub3QgaGF2ZSBIUEQgcGluIHdpcmVk
IGNvcnJlY3RseS4gU28gaWYgRFBDRCByZWFkIGZhaWxzLA0KICogd2hpY2ggaXQgc2hvdWxkIG5l
dmVyIGhhcHBlbiwgcmV0cnkgYSBmZXcgdGltZXMuIFRhcmdldCB3b3JzdA0KICogY2FzZSBzY2Vu
YXJpbyBvZiA4MCBtcy4NCiAqLw0KDQpTd2l0Y2ggdWRlbGF5IHRvIG1zbGVlcCB0byBhdm9pZCBs
aW1pdHMgb24gYXJtLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rLmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLmMNCmluZGV4IGQ2ZjhiZTY1NGMyZS4uYzE3ZGI1YzE0NGFhIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMNCkBAIC01NTAsNyArNTUwLDcg
QEAgc3RhdGljIHZvaWQgcmVhZF9lZHBfY3VycmVudF9saW5rX3NldHRpbmdzX29uX2RldGVjdChz
dHJ1Y3QgZGNfbGluayAqbGluaykNCiAJCQlicmVhazsNCiAJCX0NCiANCi0JCXVkZWxheSg4MDAw
KTsNCisJCW1zbGVlcCg4KTsNCiAJfQ0KIA0KIAlBU1NFUlQoc3RhdHVzID09IERDX09LKTsNCi0t
IA0KMi4yMC4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
