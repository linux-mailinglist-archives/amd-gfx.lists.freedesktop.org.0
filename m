Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83777171E1
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 08:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC05892A9;
	Wed,  8 May 2019 06:46:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam05on0626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe50::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71E9892A9
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 06:46:34 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3376.namprd12.prod.outlook.com (20.178.240.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Wed, 8 May 2019 06:46:33 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6%2]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 06:46:33 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/4] drm/amd/powerplay: valid Vega10
 DPMTABLE_OD_UPDATE_VDDC settings
Thread-Topic: [PATCH 2/4] drm/amd/powerplay: valid Vega10
 DPMTABLE_OD_UPDATE_VDDC settings
Thread-Index: AQHVBJt2OggLl3F2R0uh/BhQDB9RDKZgyhpQ
Date: Wed, 8 May 2019 06:46:32 +0000
Message-ID: <MN2PR12MB33444843B4E2E5354240A685E4320@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190507060859.27650-1-evan.quan@amd.com>
 <20190507060859.27650-2-evan.quan@amd.com>
In-Reply-To: <20190507060859.27650-2-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [210.13.97.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ea68332-4eae-42d2-da53-08d6d380e8a4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3376; 
x-ms-traffictypediagnostic: MN2PR12MB3376:
x-microsoft-antispam-prvs: <MN2PR12MB337617655DCAD16E7CD98B42E4320@MN2PR12MB3376.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(366004)(199004)(189003)(13464003)(26005)(6246003)(476003)(74316002)(256004)(5660300002)(186003)(2501003)(110136005)(7696005)(76176011)(86362001)(11346002)(446003)(6506007)(53546011)(102836004)(66476007)(81156014)(6436002)(68736007)(54906003)(25786009)(14444005)(72206003)(55016002)(81166006)(9686003)(8676002)(3846002)(6116002)(14454004)(2906002)(229853002)(71200400001)(71190400001)(8936002)(486006)(53936002)(52536014)(4326008)(66066001)(478600001)(66946007)(64756008)(7736002)(316002)(33656002)(66446008)(99286004)(76116006)(73956011)(305945005)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3376;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xvsgjOjXqrgqtBkGeQFwD6aYcbB8VugSQtaPV4BBZndabdaaMKnKbyiU8lAj3/lPm7GuRiJ+4whtVcXI9KBaK85Mp1z57KFuGY8oHBS+4HZ0nuJVa/zrGYEYja88HTkq1bkbxR7j5lnc0B/a7QAzRaKKPzHLwnkvFZnkl8+SRmI1PW1ElCQvqNMSMCyEh+MM4WJtBcbJjxQXKqug8V1Zgq9vEgOneJdb3pCTuOX0sjyVAPKKmwRkPZ8Vi6rf6o1JcHznY+TQ9MWFJ6316d38o6XPdQ1OvV3bPUXPw/9EU20YGgITfjcLb09eHlU1YAy+8DJ2k7lDzFmX3ClA5nmBbtiDTkxM+ZXuZy5C8j4Tukxmj7D4WuG3S4Fi/ZYy/1AQcSwP61MpI3XBxVNIkvLHEulKy+yTGcgQVRtpnPmIUQQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea68332-4eae-42d2-da53-08d6d380e8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 06:46:33.0935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3376
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUQwbgX65ORRktko/EPLa/aaBKBzQoh+Uf+LTgidCGU=;
 b=HD1wJj1oQe/97riUFpL7oWl4Kcj/XlR0OyDaF4GugsHogGm8E3tZQn25n+CLtvYqQF6cHYIpfcPIpMJ7sTXF1n/e5SVyOtr6YLaQhlMQIGy6NnjNtGg9S0BU/3EMe8K2nW2YfNrYYuwmeH6ByPfnkOoY2PF0fUt4dkhzPijeFqs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "yanik@yiannakis.de" <yanik@yiannakis.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SnVzdCBzZW50IG91dCBhIFYyIHZlcnNpb24gYW5kIGRyb3AgdGhpcyBvbmUuDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNv
bT4NCj4gU2VudDogMjAxOeW5tDXmnIg35pelIDE0OjA5DQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogeWFuaWtAeWlhbm5ha2lzLmRlOyBEZXVjaGVyLCBBbGV4YW5k
ZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBRdWFuLCBFdmFuIDxFdmFuLlF1YW5A
YW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDIvNF0gZHJtL2FtZC9wb3dlcnBsYXk6IHZhbGlk
IFZlZ2ExMA0KPiBEUE1UQUJMRV9PRF9VUERBVEVfVkREQyBzZXR0aW5ncw0KPiANCj4gV2l0aCB1
c2VyIHNwZWNpZmllZCB2b2x0YWdlKERQTVRBQkxFX09EX1VQREFURV9WRERDKSwgdGhlIEFWRlMg
d2lsbA0KPiBiZSBkaXNhYmxlZC4gSG93ZXZlciwgdGhlIGJ1Z2d5IGNvZGUgbWFrZXMgdGhpcyBh
Y3R1YWxseSBub3Qgd29ya2luZyBhcw0KPiBleHBlY3RlZC4NCj4gDQo+IENoYW5nZS1JZDogSWZh
ODNhNjI1NWJiM2Y2ZmE0YmRiNGRlNjE2NTIxY2I3YmFiNjgzMGENCj4gU2lnbmVkLW9mZi1ieTog
RXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL3Bvd2VycGxheS9od21nci92ZWdhMTBfaHdtZ3IuYyB8IDcgKy0tLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvdmVnYTEwX2h3bWdyLmMNCj4g
aW5kZXggMTM4ZjlmOWVhNzY1Li4xMDNmN2UzZjA3ODMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3ZlZ2ExMF9od21nci5jDQo+IEBAIC0yNDY2
LDExICsyNDY2LDYgQEAgc3RhdGljIHZvaWQNCj4gdmVnYTEwX2NoZWNrX2RwbV90YWJsZV91cGRh
dGVkKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpDQo+ICAJCQlyZXR1cm47DQo+ICAJCX0NCj4gIAl9
DQo+IC0NCj4gLQlpZiAoZGF0YS0+bmVlZF91cGRhdGVfZHBtX3RhYmxlICYNCj4gRFBNVEFCTEVf
T0RfVVBEQVRFX1ZEREMpIHsNCj4gLQkJZGF0YS0+bmVlZF91cGRhdGVfZHBtX3RhYmxlICY9DQo+
IH5EUE1UQUJMRV9PRF9VUERBVEVfVkREQzsNCj4gLQkJZGF0YS0+bmVlZF91cGRhdGVfZHBtX3Rh
YmxlIHw9DQo+IERQTVRBQkxFX09EX1VQREFURV9TQ0xLIHwgRFBNVEFCTEVfT0RfVVBEQVRFX01D
TEs7DQo+IC0JfQ0KPiAgfQ0KPiANCj4gIC8qKg0KPiBAQCAtMzY4Myw3ICszNjc4LDcgQEAgc3Rh
dGljIGludCB2ZWdhMTBfc2V0X3Bvd2VyX3N0YXRlX3Rhc2tzKHN0cnVjdA0KPiBwcF9od21nciAq
aHdtZ3IsDQo+IA0KPiAgCXZlZ2ExMF91cGRhdGVfYXZmcyhod21ncik7DQo+IA0KPiAtCWRhdGEt
Pm5lZWRfdXBkYXRlX2RwbV90YWJsZSAmPSBEUE1UQUJMRV9PRF9VUERBVEVfVkREQzsNCj4gKwlk
YXRhLT5uZWVkX3VwZGF0ZV9kcG1fdGFibGUgPSAwOw0KPiANCj4gIAlyZXR1cm4gMDsNCj4gIH0N
Cj4gLS0NCj4gMi4yMS4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
