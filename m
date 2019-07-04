Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C97DD5F199
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 04:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BC96E258;
	Thu,  4 Jul 2019 02:46:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790078.outbound.protection.outlook.com [40.107.79.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADF66E21B
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 02:46:21 +0000 (UTC)
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1417.namprd12.prod.outlook.com (10.168.236.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 02:46:19 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::4975:2f30:93db:bcaa%9]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 02:46:19 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Xiao, Jack" <Jack.Xiao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: increase waiting time for smu response
Thread-Topic: [PATCH] drm/amd/powerplay: increase waiting time for smu response
Thread-Index: AQHVMVZdq9aOrPru8UK6AGHgTk4y1Ka5whCA
Date: Thu, 4 Jul 2019 02:46:19 +0000
Message-ID: <DM5PR12MB141835B303D4F7C4E1FBDD16FCFA0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1562127464-25780-1-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1562127464-25780-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cda7a64-5151-49fc-64ee-08d70029cb16
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1417; 
x-ms-traffictypediagnostic: DM5PR12MB1417:
x-microsoft-antispam-prvs: <DM5PR12MB1417FF0D2D6717BA1D1E9E02FCFA0@DM5PR12MB1417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(199004)(189003)(13464003)(66446008)(33656002)(64756008)(5660300002)(68736007)(476003)(6436002)(7736002)(6246003)(86362001)(73956011)(446003)(478600001)(76176011)(55016002)(316002)(110136005)(14454004)(99286004)(72206003)(26005)(8936002)(25786009)(66066001)(6506007)(66556008)(256004)(71190400001)(186003)(2501003)(81166006)(6116002)(81156014)(52536014)(8676002)(2906002)(229853002)(66946007)(66476007)(102836004)(305945005)(11346002)(53546011)(76116006)(74316002)(3846002)(9686003)(486006)(71200400001)(53936002)(6636002)(7696005)(69900200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1417;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bhbw/z7gCbspTuUYWSw1OhHcYscemfHU47tGrS+zuE+lnAPuvgAQStenb0qyQIDHuVr04J8/Mf5Dc2H42OrH7sN8UKij6d3usl4ar398747GKnP+B2ngnGFSCQMpoK4U7si+gLM+kK7kSap4+PKTFK5ka6iYpQUrir8ACXcgUWWIXWwbj1sW7GypktZpCIExBedVPt3nWAT6Cs959v19fQiIOJizlEV2dLn/vhGaW1Op5gbVswRDYFUCRIUqWcd5+2PYZo8i5+Ft4vti455fSK8ZUbi0F17G3yrriZYn0fn3waA7siC1CNYpLDIXnjFcr7jrLuTDsnBXE+DkLZqRMnMzSzZkcR1yIOvL5TJGVLIV6gRpLWL4UpwCVZlpUN+FiAH3G56uFHHfvpfR9VF26ftSSpK8eQTvShEgWIGl4Xk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cda7a64-5151-49fc-64ee-08d70029cb16
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 02:46:19.5744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXQdOl8i7Gp0zGq6gGap9hpDIiHcKiHdUs+g6ipFdFc=;
 b=vQKLrNm99X0IPbegjYEzdzgt5APxnBe5kn58LXSeM4UuHeZeJB8FsHKKaxzTd8ZsBmCLSzfLV91gXEkJ66p8B54h9anyN5G2OPt2BfSASwQvCnw5Bq+8s8qE3kvjrIhrjTbSahIdGlFpMAkIyr7utPd39i9pAoHXpQ6R25SZRSA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBYaWFvLCBK
YWNrIDxKYWNrLlhpYW9AYW1kLmNvbT4gDQpTZW50OiAyMDE55bm0N+aciDPml6UgMTI6MTgNClRv
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4
YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1k
LmNvbT4NCkNjOiBYaWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRD
SF0gZHJtL2FtZC9wb3dlcnBsYXk6IGluY3JlYXNlIHdhaXRpbmcgdGltZSBmb3Igc211IHJlc3Bv
bnNlDQoNCldlIG9ic2VydmVkIHNvbWUgU01VIGNvbW1hbmRzIHRha2UgbW9yZSB0aW1lIGZvciBl
eGVjdXRpb24sIHNvIGluY3JlYXNlIHdhaXRpbmcgdGltZSBmb3IgcmVzcG9uc2UuDQoNClNpZ25l
ZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyB8IDYgKysrLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCmluZGV4IGJjMzk2OTAuLjg4ZDMxMjcgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0KKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMNCkBAIC02NCw5ICs2NCw5IEBA
IHN0YXRpYyBpbnQgc211X3YxMV8wX3JlYWRfYXJnKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1
aW50MzJfdCAqYXJnKSAgc3RhdGljIGludCBzbXVfdjExXzBfd2FpdF9mb3JfcmVzcG9uc2Uoc3Ry
dWN0IHNtdV9jb250ZXh0ICpzbXUpICB7DQogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
c211LT5hZGV2Ow0KLQl1aW50MzJfdCBjdXJfdmFsdWUsIGk7DQorCXVpbnQzMl90IGN1cl92YWx1
ZSwgaSwgdGltZW91dCA9IGFkZXYtPnVzZWNfdGltZW91dCAqIDEwOw0KIA0KLQlmb3IgKGkgPSAw
OyBpIDwgYWRldi0+dXNlY190aW1lb3V0OyBpKyspIHsNCisJZm9yIChpID0gMDsgaSA8IHRpbWVv
dXQ7IGkrKykgew0KIAkJY3VyX3ZhbHVlID0gUlJFRzMyX1NPQzE1KE1QMSwgMCwgbW1NUDFfU01O
X0MyUE1TR185MCk7DQogCQlpZiAoKGN1cl92YWx1ZSAmIE1QMV9DMlBNU0dfOTBfX0NPTlRFTlRf
TUFTSykgIT0gMCkNCiAJCQlicmVhazsNCkBAIC03NCw3ICs3NCw3IEBAIHN0YXRpYyBpbnQgc211
X3YxMV8wX3dhaXRfZm9yX3Jlc3BvbnNlKHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KIAl9DQog
DQogCS8qIHRpbWVvdXQgbWVhbnMgd3JvbmcgbG9naWMgKi8NCi0JaWYgKGkgPT0gYWRldi0+dXNl
Y190aW1lb3V0KQ0KKwlpZiAoaSA9PSB0aW1lb3V0KQ0KIAkJcmV0dXJuIC1FVElNRTsNCiANCiAJ
cmV0dXJuIFJSRUczMl9TT0MxNShNUDEsIDAsIG1tTVAxX1NNTl9DMlBNU0dfOTApID09IDB4MSA/
IDAgOiAtRUlPOw0KLS0NCjEuOS4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
