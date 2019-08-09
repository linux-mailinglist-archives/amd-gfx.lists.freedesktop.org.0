Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A53DC87902
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028106ED6A;
	Fri,  9 Aug 2019 11:48:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710070.outbound.protection.outlook.com [40.107.71.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2306ED6A
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:48:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flGJGxilinDlzAqBdh3K0TXGJiVeAn+KSszBIRnj/XrdD8o01JmkniTmJH3UkEr0QWiulRXgZadk5rCwbtCWzKQ+zqtsX1UOI+Upp7ITSBDrIHo0n4MVqOpqQdEzi1Sdqsfea7SrlGMuqU9jHuB9ZF722owhuUrrbNaLPtCfcXA4pLtl50otKsOwLy0JJwxQ6n0cplX3fout4tKJjWTMLI84YINrsCrAhnZbLCsn/qZz9OqHwLnbAtw0dPQlqKHxcB470Ix3w2LGe1TbQC/dPL09fGrVdizqDjdpqJsWS6p1DpzN9JdIVqNkW+DdOBfh2S7YlLFtcj6ez/kj60QwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obRfh3LIsTmYJPnxk5lAzEZ+Jbct3eES+8nM25ccuo0=;
 b=F0+uh4vjJrFKRisZObWT9igPTU7gynPX1Wr4FUeq7IBzP96DOk6lkJcnNgQ3ssITpzp6tpml3wyB4GfdLoN4JUUJwa+DeFwVPIfVnNfkwPuMjC3iHi8Eno8AAymwLCxyk96FLFhrjpfWFgmVUs/MoCADkpRyOnKiij1Cv23jdHnDADUTDErYGhzKVs9iKfQd6CEVVxEzwGt8NU6iULv9JcjaernyGHSWFYdeyN7rnDYUEASRblD1x6uq8eP0TlB3xochdBF+0QymX/BB692lzvelUI2RiGFdZJXPi/nCiGJV+6S4nzLMDWBaMkE5kMsz0p3XdHJbkBa0VCBajCZczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1674.namprd12.prod.outlook.com (10.172.40.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 9 Aug 2019 11:48:24 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 11:48:24 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Russell, Kent" <Kent.Russell@amd.com>
Subject: Re: [PATCH] drm/amdgpu: remove ras block's feature status info in
 sysfs
Thread-Topic: [PATCH] drm/amdgpu: remove ras block's feature status info in
 sysfs
Thread-Index: AQHVTpf2/6Uy92GcmkeeFea88O/FYqbynTQAgAAWRwA=
Date: Fri, 9 Aug 2019 11:48:24 +0000
Message-ID: <fad23323-9f9b-93aa-bd52-b1b3bfd4c67b@amd.com>
References: <20190809095047.12372-1-tao.zhou1@amd.com>
 <MWHPR12MB1424FCE0F9D5E8C7835EEE8AFCD60@MWHPR12MB1424.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB1424FCE0F9D5E8C7835EEE8AFCD60@MWHPR12MB1424.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0141.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::33) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3c75f72-eedc-4833-eb42-08d71cbf7bca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1674; 
x-ms-traffictypediagnostic: DM5PR12MB1674:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB16748752164212CAB7C4612183D60@DM5PR12MB1674.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:158;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(189003)(13464003)(199004)(76176011)(6436002)(229853002)(2906002)(256004)(66556008)(66446008)(14454004)(6486002)(8676002)(66476007)(8936002)(316002)(53936002)(81166006)(64126003)(81156014)(71190400001)(6306002)(966005)(64756008)(71200400001)(6246003)(110136005)(6506007)(66946007)(58126008)(36756003)(2501003)(65806001)(476003)(11346002)(46003)(52116002)(486006)(7736002)(25786009)(2616005)(6116002)(386003)(102836004)(53546011)(6512007)(86362001)(6636002)(5660300002)(65826007)(305945005)(478600001)(186003)(99286004)(31686004)(446003)(65956001)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1674;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3eMBRDFO3gaDtq4e7ddqR/Vp5lWLR7emI40DVyiRqybeKREqZNIA4WJtj4oASagLxh6PZIYy6eaCzyMb+VmZygNOGSTruD8gc5HXTaD52/WJgthQurlncRDBH3LKoCqVy7n/Jvsjy2pOuNcRkLFQ5hSTYykvZIDAiutLDGFmRcnNp4N2zN61kWj4J9rr4Mg1oUxMr6pHxyAeaI1sVc9BsRKRVHnWY/PthcRjDXA51Ke8k7QhbAaAaMdY8eF6/ThAZpap9N5RU/iWPcOgx2LcHYxcsLiODJuzw05YcxIGb2Zwys+b/BJJaSlqBgVL8LONksB994biKQiYoiSOW0MIwTOhXNM2RWBs6Gvws4f+hAPilidlltRb02PgR7WRVTN6gZk1AbEvbK3uUsdnOcyAEHHKKTCoA15laZkeIcrWYAA=
Content-ID: <AD68D0DBFE8C304B9AFB68CA0B9D716A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c75f72-eedc-4833-eb42-08d71cbf7bca
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 11:48:24.1240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2VmEYBJ/kNlQA9J9Lg6mvFl86+yn2DcxE+Onkt1NBK2tGVvh+CJLkdLd9c35uIRe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1674
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obRfh3LIsTmYJPnxk5lAzEZ+Jbct3eES+8nM25ccuo0=;
 b=FUNZyjbwamLHk0V/6ra5+ztqxy8F4wtjkLp9hmYNsoH1/ZlR+f1aWh3bUI04x+HOnPvJXCQAauq4z3hisw4gbwQz8VB6J0WrOmFwDxaqHmyyXM66ztn1VVDpQDlLjHf+uHWFbStRuJLzVlMf/r9XGdJFmpFjKUbel32U2wfh3nc=
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

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Cg0KQW0gMDkuMDguMTkgdW0gMTI6Mjggc2NocmllYiBaaGFuZywgSGF3a2luZzoNCj4gUmV2aWV3
ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4NCj4gUmVnYXJk
cywNCj4gSGF3a2luZw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBh
bWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYg
T2YgVGFvIFpob3UNCj4gU2VudDogMjAxOeW5tDjmnIg55pelIDE3OjUxDQo+IFRvOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2Vu
aWdAYW1kLmNvbT47IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBGcmVl
aGlsbCwgQ2hyaXMgPENocmlzLkZyZWVoaWxsQGFtZC5jb20+OyBSdXNzZWxsLCBLZW50IDxLZW50
LlJ1c3NlbGxAYW1kLmNvbT4NCj4gQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHJlbW92ZSByYXMgYmxvY2sncyBmZWF0dXJl
IHN0YXR1cyBpbmZvIGluIHN5c2ZzDQo+DQo+IGZlYXR1cmUgbWFzayBpbmZvIGlzIGVub3VnaCBm
b3Igcm9jbSB0b29sLCAiY2F0IC9zeXMvY2xhc3MvZHJtL2NhcmQwL2RldmljZS9yYXMvZmVhdHVy
ZXMiIHdpbGwgZ2V0IHRoZSBpbmZvIGxpa2UgdGhpczoNCj4NCj4gZmVhdHVyZSBtYXNrOiAweDNm
ZmINCj4NCj4gU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAxOSArLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxOCBk
ZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0K
PiBpbmRleCBiZTU5MTAyNTI2YTEuLjUwYzEzYjAyZDIzNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYw0KPiBAQCAtNzkxLDI1ICs3OTEsOCBAQCBzdGF0aWMg
c3NpemVfdCBhbWRncHVfcmFzX3N5c2ZzX2ZlYXR1cmVzX3JlYWQoc3RydWN0IGRldmljZSAqZGV2
LCAgew0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0NCj4gICAJCWNvbnRhaW5lcl9vZihh
dHRyLCBzdHJ1Y3QgYW1kZ3B1X3JhcywgZmVhdHVyZXNfYXR0cik7DQo+IC0Jc3RydWN0IGRybV9k
ZXZpY2UgKmRkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gLQlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IGRkZXYtPmRldl9wcml2YXRlOw0KPiAtCXN0cnVjdCByYXNfY29tbW9uX2lm
IGhlYWQ7DQo+IC0JaW50IHJhc19ibG9ja19jb3VudCA9IEFNREdQVV9SQVNfQkxPQ0tfQ09VTlQ7
DQo+IC0JaW50IGksIGVuYWJsZWQ7DQo+IC0Jc3NpemVfdCBzOw0KPiAtDQo+IC0JcyA9IHNjbnBy
aW50ZihidWYsIFBBR0VfU0laRSwgImZlYXR1cmUgbWFzazogMHgleFxuIiwgY29uLT5mZWF0dXJl
cyk7DQo+IC0NCj4gLQlmb3IgKGkgPSAwOyBpIDwgcmFzX2Jsb2NrX2NvdW50OyBpKyspIHsNCj4g
LQkJaGVhZC5ibG9jayA9IGk7DQo+IC0JCWVuYWJsZWQgPSBhbWRncHVfcmFzX2lzX2ZlYXR1cmVf
ZW5hYmxlZChhZGV2LCAmaGVhZCk7DQo+IC0NCj4gLQkJcyArPSBzY25wcmludGYoJmJ1ZltzXSwg
UEFHRV9TSVpFIC0gcywNCj4gLQkJCQkiJXMgcmFzIGZlYXR1cmUgbWFzazogJXNcbiIsDQo+IC0J
CQkJcmFzX2Jsb2NrX3N0cihpKSwgZW5hYmxlZD8ib24iOiJvZmYiKTsNCj4gLQl9DQo+ICAgDQo+
IC0JcmV0dXJuIHM7DQo+ICsJcmV0dXJuIHNjbnByaW50ZihidWYsIFBBR0VfU0laRSwgImZlYXR1
cmUgbWFzazogMHgleFxuIiwNCj4gK2Nvbi0+ZmVhdHVyZXMpOw0KPiAgIH0NCj4gICANCj4gICBz
dGF0aWMgaW50IGFtZGdwdV9yYXNfc3lzZnNfY3JlYXRlX2ZlYXR1cmVfbm9kZShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikNCj4gLS0NCj4gMi4xNy4xDQo+DQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
