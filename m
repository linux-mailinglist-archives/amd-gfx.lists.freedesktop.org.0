Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C5618849
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 12:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB21892C9;
	Thu,  9 May 2019 10:25:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780054.outbound.protection.outlook.com [40.107.78.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA154892C9
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 10:25:49 +0000 (UTC)
Received: from BYAPR12MB3301.namprd12.prod.outlook.com (20.179.93.222) by
 BYAPR12MB2599.namprd12.prod.outlook.com (20.176.255.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.15; Thu, 9 May 2019 10:25:47 +0000
Received: from BYAPR12MB3301.namprd12.prod.outlook.com
 ([fe80::dcb6:2d1b:43fd:2e40]) by BYAPR12MB3301.namprd12.prod.outlook.com
 ([fe80::dcb6:2d1b:43fd:2e40%4]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 10:25:47 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/sched: fix the duplicated TMO message for one IB
Thread-Topic: [PATCH] drm/sched: fix the duplicated TMO message for one IB
Thread-Index: AQHVBiApks2+wxa9uUu9tWDK7+Bjf6ZiYnKAgAAz74A=
Date: Thu, 9 May 2019 10:25:47 +0000
Message-ID: <BYAPR12MB3301677254798D131BC7E8FB84330@BYAPR12MB3301.namprd12.prod.outlook.com>
References: <1557376305-24294-1-git-send-email-Monk.Liu@amd.com>
 <ca57f69d-eced-8e9d-5a07-42a642d96a0f@gmail.com>
In-Reply-To: <ca57f69d-eced-8e9d-5a07-42a642d96a0f@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: daf97e8a-ffed-448f-30ff-08d6d468b3d7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2599; 
x-ms-traffictypediagnostic: BYAPR12MB2599:
x-microsoft-antispam-prvs: <BYAPR12MB2599F668DB1CA7AEC8680FAA84330@BYAPR12MB2599.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(366004)(39860400002)(396003)(346002)(199004)(189003)(13464003)(76176011)(66574012)(74316002)(6116002)(3846002)(66066001)(9686003)(99286004)(256004)(110136005)(53936002)(14444005)(6246003)(26005)(229853002)(7696005)(2501003)(305945005)(86362001)(52536014)(8936002)(33656002)(2906002)(7736002)(68736007)(15650500001)(316002)(478600001)(53546011)(6436002)(66946007)(5660300002)(14454004)(6506007)(66556008)(66476007)(64756008)(72206003)(476003)(446003)(76116006)(102836004)(25786009)(73956011)(11346002)(8676002)(486006)(71200400001)(66446008)(71190400001)(186003)(81156014)(81166006)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2599;
 H:BYAPR12MB3301.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NYSbB3Hv+4243G9ESaYC+i77TRWYUyEEAcxMT1OZraeX4BK2OmAEiQajth3fLbUs/Bji/XdvQPYKGdpKV8Mbg9w0mRRNow22Bgmscf7Xbsikeuo+tDH13XCVotV/o7sUSDt0Rd8JcvE3NDaxLbzwBVYqIjInatO2n5+rrkOXxUkB35zapqzI7kvGdp/xsnGUP3uzVjbtMS7ABZLJJDi0bgIALlbFI6YvpQ2UzVTy9sn/+uiGLu6HmUnq75EmQlnqkz6PFqqf5HLiffGsmLtrApsjEl/KnqJ5eggIg0uDR4z14skXrm6gpPoSMQhjUmRY31uZpg21AAbOVupyGXDzd/CjyxC7TLaSNW+FH2ViEQl5MzkcOX3q8YFrN9ir8OdhF4lWRp4Veck45WWfvigrmrn415iADtVgMuZT2uS8ZP4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf97e8a-ffed-448f-30ff-08d6d468b3d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 10:25:47.6614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2599
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RAOSRZ7f/U7nAl6iHITgK23sRWxXCqdoXwxJC0SKyI=;
 b=aBxZ9AQE+xXXSfiynzAN/3sv/VFX8Ktxqq17cJZkEUwG7uxAK2uWDsPJ3zWvF17SzWShh0qW1JDdyTbTadwfC3ZF3/GnS6AIRxKA/zUDhYCLHwzW8iLgpzosoP+BhoWJTFYE9WNsAGabqUundxPI7rAN8I3Hlli1PDRfaYboysM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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

Q2hyaXN0aWFuDQoNCkNoZWNrICJkcm1fc2NoZWRfc3RhcnQiIHdoaWNoIGlzIGludm9rZWQgZnJv
bSBncHVfcmVjb3ZlcigpICwgdGhlcmUgaXMgYSAiZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoKSIg
aW4gdGhlIHRhaWwgDQoNCi9Nb25rDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gDQpT
ZW50OiBUaHVyc2RheSwgTWF5IDksIDIwMTkgMzoxOCBQTQ0KVG86IExpdSwgTW9uayA8TW9uay5M
aXVAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog
W1BBVENIXSBkcm0vc2NoZWQ6IGZpeCB0aGUgZHVwbGljYXRlZCBUTU8gbWVzc2FnZSBmb3Igb25l
IElCDQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KQW0gMDkuMDUuMTkgdW0gMDY6MzEg
c2NocmllYiBNb25rIExpdToNCj4gd2UgZG9uJ3QgbmVlZCBkdXBsaWNhdGVkIElCJ3MgdGltZW91
dCBlcnJvciBtZXNzYWdlIHJlcG9ydGVkIA0KPiBlbmRsZXNzbHksIGp1c3Qgb25lIHJlcG9ydCBw
ZXIgdGltZWRvdXQgSUIgaXMgZW5vdWdoDQoNCldlbGwsIE5BSy4gV2UgZG9uJ3QgbmVlZCBtdWx0
aXBsZSB0aW1lb3V0IHJlcG9ydHMsIGJ1dCB3ZSByZWFsbHkgbmVlZCB0byByZXN0YXJ0IHRoZSB0
aW1lb3V0IGNvdW50ZXIgYWZ0ZXIgaGFuZGxpbmcgaXQuDQoNCk90aGVyd2lzZSB3ZSB3aWxsIG5l
dmVyIHJ1biBpbnRvIGEgdGltZW91dCBhZ2FpbiBhZnRlciBoYW5kbGluZyBvbmUgYW5kIGl0IGlz
bid0IHVubGlrZWx5IHRoYXQgbXVsdGlwbGUgSUJzIGluIGEgcm93IGRvZXNuJ3Qgd29yayBjb3Jy
ZWN0bHkuDQoNCkNocmlzdGlhbi4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNb25rIExpdSA8TW9u
ay5MaXVAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMgfCA1IC0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiBpbmRleCBjMWFh
Zjg1Li5kNmMxN2YxIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX21haW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4u
Yw0KPiBAQCAtMzA4LDcgKzMwOCw2IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9qb2JfdGltZWRv
dXQoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgIHsNCj4gICAgICAgc3RydWN0IGRybV9n
cHVfc2NoZWR1bGVyICpzY2hlZDsNCj4gICAgICAgc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYjsN
Cj4gLSAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4NCj4gICAgICAgc2NoZWQgPSBjb250YWlu
ZXJfb2Yod29yaywgc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyLCB3b3JrX3Rkci53b3JrKTsNCj4g
ICAgICAgam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZzY2hlZC0+cmluZ19taXJyb3Jf
bGlzdCwNCj4gQEAgLTMxNiwxMCArMzE1LDYgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVkX2pvYl90
aW1lZG91dChzdHJ1Y3QgDQo+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPg0KPiAgICAgICBpZiAoam9i
KQ0KPiAgICAgICAgICAgICAgIGpvYi0+c2NoZWQtPm9wcy0+dGltZWRvdXRfam9iKGpvYik7DQo+
IC0NCj4gLSAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFn
cyk7DQo+IC0gICAgIGRybV9zY2hlZF9zdGFydF90aW1lb3V0KHNjaGVkKTsNCj4gLSAgICAgc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gICB9
DQo+DQo+ICAgIC8qKg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
