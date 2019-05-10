Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291519A1F
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 10:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DBA5895B6;
	Fri, 10 May 2019 08:57:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7083E895B6
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 08:57:40 +0000 (UTC)
Received: from CY4PR12MB1543.namprd12.prod.outlook.com (10.172.70.20) by
 CY4PR12MB1573.namprd12.prod.outlook.com (10.172.70.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 10 May 2019 08:57:39 +0000
Received: from CY4PR12MB1543.namprd12.prod.outlook.com
 ([fe80::c43a:8684:a852:2124]) by CY4PR12MB1543.namprd12.prod.outlook.com
 ([fe80::c43a:8684:a852:2124%7]) with mapi id 15.20.1856.012; Fri, 10 May 2019
 08:57:39 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Topic: [PATCH] drm/amdgpu: avoid duplicated tmo report on same job
Thread-Index: AQHVBwCBOnzmYyYee0WGkzqcROAC1aZj8yGAgAAbpoA=
Date: Fri, 10 May 2019 08:57:39 +0000
Message-ID: <c1c9ec0a-6d11-849b-80a3-5d0d35b06dcd@amd.com>
References: <1557472668-12462-1-git-send-email-Monk.Liu@amd.com>
 <DM6PR12MB3305DCE921FE18B7C909C3C5840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB3305DCE921FE18B7C909C3C5840C0@DM6PR12MB3305.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::38) To CY4PR12MB1543.namprd12.prod.outlook.com
 (2603:10b6:910:c::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c06e179-e433-40c0-44d9-08d6d5258db8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1573; 
x-ms-traffictypediagnostic: CY4PR12MB1573:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR12MB1573BC979F023E63340CF468830C0@CY4PR12MB1573.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:551;
x-forefront-prvs: 0033AAD26D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(39860400002)(136003)(376002)(396003)(199004)(189003)(13464003)(31696002)(6246003)(966005)(72206003)(2501003)(14454004)(36756003)(65826007)(2906002)(8936002)(6116002)(65806001)(65956001)(305945005)(53936002)(7736002)(6512007)(6306002)(8676002)(64126003)(102836004)(53546011)(25786009)(11346002)(58126008)(81156014)(476003)(486006)(46003)(110136005)(6486002)(2616005)(186003)(99286004)(6436002)(256004)(14444005)(316002)(76176011)(478600001)(52116002)(31686004)(68736007)(73956011)(64756008)(86362001)(71190400001)(71200400001)(229853002)(81166006)(6506007)(66946007)(386003)(446003)(66556008)(66446008)(5660300002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1573;
 H:CY4PR12MB1543.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P3PwLxCRm44/J2rBQdrUaO0MPy/mAFeQjcRbXY+z2Gg6kfh8yQXXL689MDMnE5CU19RmcB95TIsFVtQKgI9YE9iKMckuCVzO4mYk4WT3IqNRXr1VjQRLjhSt8UXpBdnEXjTMP8HLqmgYQUQkVuXczABcaqmCDSs4KtUqaksxnaD6dAvmsuHvKrPAuTnf6cFZ280F0bAOZIpPqv75Qka2+F2ySHMBgPFSSUZ33g0LKfHzotFBS/23E3jiyPiofqqcIUJCYly/+OxkZdW0POMP97Vsqxs4jBvrSUM0iDMkC6G/M6TRFQleuxOD19owLirtMaEDhfMHZINHkPShK8F9dBOCQUNSOnQPWA6zGEwC9Futp5h3CLxlFpRCCVIwDZCIoP2MTqI83rnYHnGOo74IQlK9zo/ZcxVdp5KJfAJeqLc=
Content-ID: <306A40E00EFC274A8563FAE640A44857@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c06e179-e433-40c0-44d9-08d6d5258db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2019 08:57:39.1607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1573
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0XThnmv/imhHJlh8D4XyxeXEGfpeApmw4lUMobrBo0=;
 b=yOr4OJLBbsDsiJp0UegCdDNyB9wesExO9GZxuF7XxV6jjklgprU5377uJEjXfMBODhAaPcyJXnjotiqsMS29bjD7dAhpNmy5XiINpdl5dmYyCJaPlqaIw4Csaxbyp4IUpei5zAapGMyllXqngDm3jcElqQWdGpBNgyGE+LftkO8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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

SGkgTW9uaywNCg0KeWVhaCwgdGhhdCdzIG11Y2ggY2xvc2VyIHRvIHdoYXQgSSBoYWQgaW4gbWlu
ZC4gQnV0IHlvdXIgY29tbWVudHMgZ290IG1lIA0KdGhpbmtpbmcgbW9yZSBhYm91dCB0aGlzLg0K
DQpXaGF0IGRvIHlvdSB0aGluayBhYm91dCBjaGFuZ2luZyBhbWRncHVfam9iX3RpbWVkb3V0KCkg
bGlrZSB0aGlzOg0KIMKgwqDCoMKgwqDCoMKgIGlmIChhbWRncHVfZGV2aWNlX3Nob3VsZF9yZWNv
dmVyX2dwdShyaW5nLT5hZGV2KSkNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYW1k
Z3B1X2RldmljZV9ncHVfcmVjb3ZlcihyaW5nLT5hZGV2LCBqb2IpOw0KK8KgwqDCoMKgIGVsc2UN
CivCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBkbWFfZmVuY2Vfd2FpdChzX2pvYi0+c19mZW5jZS0+
cGFyZW50KTsNCg0KDQpUaGlzIHdheSB3ZSB3b3VsZCBibG9jayB0aGUgdGltZW91dCB3b3JrZXIg
dW50aWwgd2UgYXJlIGVpdGhlciBtYW51YWxseSANCnJlc2V0dGluZyB1c2luZyBkZWJ1Z2ZzIG9y
IHVubG9hZGluZyB0aGUgZHJpdmVyLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQpBbSAxMC4w
NS4xOSB1bSAwOToxOSBzY2hyaWViIExpdSwgTW9uazoNCj4gSGkgQ2hyaXN0aWFuLA0KPg0KPiBX
aGF0IGFib3V0IHRoaXMgb25lLCBubyB0aW1lciBsb2dpYyBjaGFuZ2Ugb24gc2NoZWR1bGVyIHBh
cnQsIG9ubHkgdGhlIGR1cGxpY2F0ZWQgdG1vIHJlcG9ydCBpcyBtdXRlZA0KPg0KPiAvTW9uaw0K
Pg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTW9uayBMaXUNCj4g
U2VudDogRnJpZGF5LCBNYXkgMTAsIDIwMTkgMzoxOCBQTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gQ2M6IExpdSwgTW9uayA8TW9uay5MaXVAYW1kLmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBhdm9pZCBkdXBsaWNhdGVkIHRtbyByZXBvcnQgb24g
c2FtZSBqb2INCj4NCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBNb25rIExpdSA8TW9uay5MaXVAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgIDMgKy0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jICAgIHwgMTIgKysrKysrKysrKystDQo+ICAgaW5j
bHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIDMgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KPiBpbmRleCBkNjI4NmVkLi5m
MWRjMGJhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jDQo+IEBAIC0zMzU2LDggKzMzNTYsNyBAQCBib29sIGFtZGdwdV9kZXZpY2Vfc2hvdWxkX3Jl
Y292ZXJfZ3B1KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgICAgICAgICByZXR1cm4g
dHJ1ZTsNCj4NCj4gICBkaXNhYmxlZDoNCj4gLSAgICAgICAgICAgICAgIERSTV9JTkZPKCJHUFUg
cmVjb3ZlcnkgZGlzYWJsZWQuXG4iKTsNCj4gLSAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsN
Cj4gKyAgICAgICByZXR1cm4gZmFsc2U7DQo+ICAgfQ0KPg0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2pvYi5jDQo+IGluZGV4IDEzOTc5NDIuLmNhNjIyNTMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMNCj4gQEAgLTMzLDYgKzMzLDcg
QEAgc3RhdGljIHZvaWQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
c19qb2IpDQo+ICAgICAgICAgIHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IHRvX2FtZGdwdV9y
aW5nKHNfam9iLT5zY2hlZCk7DQo+ICAgICAgICAgIHN0cnVjdCBhbWRncHVfam9iICpqb2IgPSB0
b19hbWRncHVfam9iKHNfam9iKTsNCj4gICAgICAgICAgc3RydWN0IGFtZGdwdV90YXNrX2luZm8g
dGk7DQo+ICsgICAgICAgYm9vbCByZWNvdmVyOw0KPg0KPiAgICAgICAgICBtZW1zZXQoJnRpLCAw
LCBzaXplb2Yoc3RydWN0IGFtZGdwdV90YXNrX2luZm8pKTsNCj4NCj4gQEAgLTQyLDYgKzQzLDEx
IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2Ig
KnNfam9iKQ0KPiAgICAgICAgICAgICAgICAgIHJldHVybjsNCj4gICAgICAgICAgfQ0KPg0KPiAr
ICAgICAgIHJlY292ZXIgPSBhbWRncHVfZGV2aWNlX3Nob3VsZF9yZWNvdmVyX2dwdShyaW5nLT5h
ZGV2KTsNCj4gKyAgICAgICBpZiAoc19qb2ItPnNjaGVkLT5sYXN0X3Rtb19pZCA9PSBzX2pvYi0+
aWQpDQo+ICsgICAgICAgICAgICAgICBnb3RvIHNraXBfcmVwb3J0Ow0KPiArDQo+ICsgICAgICAg
c19qb2ItPnNjaGVkLT5sYXN0X3Rtb19pZCA9IHNfam9iLT5pZDsNCj4gICAgICAgICAgYW1kZ3B1
X3ZtX2dldF90YXNrX2luZm8ocmluZy0+YWRldiwgam9iLT5wYXNpZCwgJnRpKTsNCj4gICAgICAg
ICAgRFJNX0VSUk9SKCJyaW5nICVzIHRpbWVvdXQsIHNpZ25hbGVkIHNlcT0ldSwgZW1pdHRlZCBz
ZXE9JXVcbiIsDQo+ICAgICAgICAgICAgICAgICAgICBqb2ItPmJhc2Uuc2NoZWQtPm5hbWUsIGF0
b21pY19yZWFkKCZyaW5nLT5mZW5jZV9kcnYubGFzdF9zZXEpLA0KPiBAQCAtNDksNyArNTUsMTEg
QEAgc3RhdGljIHZvaWQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
c19qb2IpDQo+ICAgICAgICAgIERSTV9FUlJPUigiUHJvY2VzcyBpbmZvcm1hdGlvbjogcHJvY2Vz
cyAlcyBwaWQgJWQgdGhyZWFkICVzIHBpZCAlZFxuIiwNCj4gICAgICAgICAgICAgICAgICAgIHRp
LnByb2Nlc3NfbmFtZSwgdGkudGdpZCwgdGkudGFza19uYW1lLCB0aS5waWQpOw0KPg0KPiAtICAg
ICAgIGlmIChhbWRncHVfZGV2aWNlX3Nob3VsZF9yZWNvdmVyX2dwdShyaW5nLT5hZGV2KSkNCj4g
KyAgICAgICBpZiAoIXJlY292ZXIpDQo+ICsgICAgICAgICAgICAgICBEUk1fSU5GTygiR1BVIHJl
Y292ZXJ5IGRpc2FibGVkLlxuIik7DQo+ICsNCj4gK3NraXBfcmVwb3J0Og0KPiArICAgICAgIGlm
IChyZWNvdmVyKQ0KPiAgICAgICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIo
cmluZy0+YWRldiwgam9iKTsgIH0NCj4NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2dwdV9z
Y2hlZHVsZXIuaCBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaCBpbmRleCA5YzJhOTU3Li4x
OTQ0ZDI3IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgNCj4gKysr
IGIvaW5jbHVkZS9kcm0vZ3B1X3NjaGVkdWxlci5oDQo+IEBAIC0yODIsNiArMjgyLDcgQEAgc3Ry
dWN0IGRybV9ncHVfc2NoZWR1bGVyIHsNCj4gICAgICAgICAgaW50ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBoYW5nX2xpbWl0Ow0KPiAgICAgICAgICBhdG9taWNfdCAgICAgICAgICAgICAg
ICAgICAgICAgIG51bV9qb2JzOw0KPiAgICAgICAgICBib29sICAgICAgICAgICAgICAgICAgICBy
ZWFkeTsNCj4gKyAgICAgICB1aW50NjRfdCBsYXN0X3Rtb19pZDsNCj4gICB9Ow0KPg0KPiAgIGlu
dCBkcm1fc2NoZWRfaW5pdChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLA0KPiAtLQ0K
PiAyLjcuNA0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
