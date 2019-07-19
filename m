Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3931C6E33A
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 11:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B932C6E5D3;
	Fri, 19 Jul 2019 09:15:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710067.outbound.protection.outlook.com [40.107.71.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD39C6E5D7
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 09:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWyhCO9u/wWe6036Jotm1OUdN4uxtDSFpDOToZot7TikJtZSMgSveSQOe7sm/feVHxay9YlwiO7QnkCtasevusTgLmGBT01z6qP+9+N0w+sHQtvh0Gys/uHrUmqb5XB986/6yxXtxUowpNc1ZsvbM3ElGBSkKi6OpyU7MyckQP+a7tSrWaqAyXGN/oBVQLHxiSOYEzpIN10VzdqEHRhfY8tzYk4VeopmqCwm85rZGwCY1BfHGdUqcOM0vfolqQRkvDYTCScU1Zj/uTBjPEgTd0MNko+WhSq+uujv3ohbv9SdL3gZ9eGdoNmP7gVI8S27uRvWATWzowLik59p5W3A/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scUivdjbZtkHMuHrw0Yct/r37AopRM4+vnbzVe7kV4Y=;
 b=l+etj2ZqLv5Cz+eahH+UnEfXg9kCf03QWtw/0a/AgRa4HNMXsHjikx1iZxTqUTpollT238/iSGaEZ6R2/s1+41uuEM4Ro1ygiQ5ziuh/3mpfAMEE95mpXwynnT2A0DZWME2ERgORigD7PZ+RPoBI7anABO4v7EhNtxLrpYHi6f16M8SMxHDEcg/JJ7Mkk5sG+QFDMTJgARF0h9vvKtUqA1QpkBTnjn6ol2P1nlFhxJZg5oUc99S5X/LEaUPVlNAg/5sh9adTrJg3HdXNGewZtHMPfaQ9TMxbC6ukTv56/oloDohF0rOUqgqUPk/0kezUZOfUrRjrFhM3P4y1lQQ6/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3672.namprd12.prod.outlook.com (52.132.231.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 09:15:30 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::6cc4:28bf:361f:d486%3]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:15:30 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: correct the bit mask for checking VCN
 power status
Thread-Topic: [PATCH] drm/amd/powerplay: correct the bit mask for checking VCN
 power status
Thread-Index: AQHVPg9DCfsI+H4RH0SZ7ngma+TUbKbRqNVw
Date: Fri, 19 Jul 2019 09:15:30 +0000
Message-ID: <CH2PR12MB3767E8B81F1BB3F34BA63123FECB0@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <20190719085145.27515-1-evan.quan@amd.com>
In-Reply-To: <20190719085145.27515-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fe75c37-0461-424a-a6a3-08d70c29a566
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3672; 
x-ms-traffictypediagnostic: CH2PR12MB3672:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR12MB3672DA3487631F91A1EE595BFECB0@CH2PR12MB3672.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(13464003)(199004)(189003)(7736002)(316002)(8936002)(33656002)(99286004)(6436002)(14454004)(81166006)(478600001)(6116002)(256004)(110136005)(2501003)(81156014)(6506007)(486006)(53936002)(8676002)(3846002)(229853002)(71190400001)(186003)(14444005)(66946007)(76116006)(6306002)(66476007)(66556008)(11346002)(86362001)(25786009)(446003)(26005)(55016002)(66066001)(71200400001)(52536014)(64756008)(74316002)(966005)(4326008)(102836004)(6246003)(7696005)(68736007)(476003)(53546011)(9686003)(2906002)(305945005)(76176011)(5660300002)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3672;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vRbmk1cuy7cClycs1vC6PaVz4LwFevbyhH1zZw+PIZCKDXueaB+4V+Xx7wuX31rQvckbQPujqJC1kg0y6+18Xh6SW4C5n5d2pf4quJa4O11dCWG5M2jxNPIfXH7YkZmiq7+x6FHyoY9LOf8GZ6nkV/xUnH4irBh929U9btgOG+BORDBWqBow0DBSzcGYdVOnmZtdVRy4Esqqc7CpK2j353YumbZ3WZil5/7eacopTra9xlEnUwfWoVhkLkTgY22xTzLoz6jOCTHz81s42fZuQcBtZ1dTX5vX/MojJRbd1RhksNiMeinLlhjhJXrAq5lxGlaDxcZAheBsmPVjI7RhoxpFvuHCtA1WSAAy31ImIR23aL3rKRr8nS53cddfX7QeHOEQPh4feq6hi7+3xBExyq1Eq+f2wjBOY9jbCxnEXvE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe75c37-0461-424a-a6a3-08d70c29a566
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:15:30.2316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: feifxu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3672
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scUivdjbZtkHMuHrw0Yct/r37AopRM4+vnbzVe7kV4Y=;
 b=iHr8s5frhbZTylWi1r6ACRPHBwKlu8H4sAI4MFr5a66wJIf7WWsJE8s9mB9eq2uF9iXRfCrl/QFX/Y2pLmimcdU7jzQGhMRXab5/0lOivU3CwEYYLnb4M2f083mvyKWDkRZNGu7nhZ+SAY7B8aiko0PVxG9Ivreej3LUITMpQ98=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEZlaWZlaSBYdSA8RmVpZmVpLlh1QGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRXZhbiBRdWFuDQpTZW50OiBGcmlkYXksIEp1bHkg
MTksIDIwMTkgNDo1MiBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzog
UXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWQv
cG93ZXJwbGF5OiBjb3JyZWN0IHRoZSBiaXQgbWFzayBmb3IgY2hlY2tpbmcgVkNOIHBvd2VyIHN0
YXR1cw0KDQpGb3IgTmF2aTEwIG9yIGxhdGVyIEFTSUNzLCBhIGRpZmZlcmVudCBiaXQgbWFzayBp
cyB1c2VkIGZvciBjaGVja2luZyBWQ04gcG93ZXIgc3RhdHVzLg0KDQpDaGFuZ2UtSWQ6IElhYTQ5
ZTVhMzM5YzM4ZjQ2ZTNlNzEyNGQyMWFlYjY1ZjY2MzMzMjVlDQpTaWduZWQtb2ZmLWJ5OiBFdmFu
IFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvYW1kZ3B1X3NtdS5jIHwgOCArKysrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYw0KaW5kZXggNmUyZjdkZjgyNmYwLi44ODc1NzdjNDc1NjggMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYw0KQEAgLTI3MSw2ICsyNzEs
OCBAQCBpbnQgc211X2dldF9wb3dlcl9udW1fc3RhdGVzKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LCAgaW50IHNtdV9jb21tb25fcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVu
dW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLA0KIAkJCSAgIHZvaWQgKmRhdGEsIHVpbnQzMl90ICpz
aXplKQ0KIHsNCisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBzbXUtPmFkZXY7DQorCXVp
bnQzMl90IHV2ZF9iaXRfbWFzayA9IDB4RkZGRkZGRkY7DQogCWludCByZXQgPSAwOw0KIA0KIAlz
d2l0Y2ggKHNlbnNvcikgew0KQEAgLTI4Nyw3ICsyODksMTEgQEAgaW50IHNtdV9jb21tb25fcmVh
ZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vu
c29yLA0KIAkJKnNpemUgPSA4Ow0KIAkJYnJlYWs7DQogCWNhc2UgQU1ER1BVX1BQX1NFTlNPUl9V
VkRfUE9XRVI6DQotCQkqKHVpbnQzMl90ICopZGF0YSA9IHNtdV9mZWF0dXJlX2lzX2VuYWJsZWQo
c211LCBTTVVfRkVBVFVSRV9EUE1fVVZEX0JJVCkgPyAxIDogMDsNCisJCWlmIChhZGV2LT5hc2lj
X3R5cGUgPT0gQ0hJUF9WRUdBMjApDQorCQkJdXZkX2JpdF9tYXNrID0gU01VX0ZFQVRVUkVfRFBN
X1VWRF9CSVQ7DQorCQllbHNlDQorCQkJdXZkX2JpdF9tYXNrID0gU01VX0ZFQVRVUkVfVkNOX1BH
X0JJVDsNCisJCSoodWludDMyX3QgKilkYXRhID0gc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUs
IHV2ZF9iaXRfbWFzaykgPyAxIDogDQorMDsNCiAJCSpzaXplID0gNDsNCiAJCWJyZWFrOw0KIAlj
YXNlIEFNREdQVV9QUF9TRU5TT1JfVkNFX1BPV0VSOg0KLS0NCjIuMjIuMA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxp
c3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
