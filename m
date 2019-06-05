Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8105936321
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 20:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156F1890BC;
	Wed,  5 Jun 2019 18:10:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858B0890BC
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 18:10:45 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1132.namprd12.prod.outlook.com (10.168.239.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Wed, 5 Jun 2019 18:10:43 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 18:10:43 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Liu, Monk" <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Topic: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Index: AQHVG2oudZY69HM9mkCE8kosxqR2paaMqc8AgAA95QCAADukUIAAOcKA
Date: Wed, 5 Jun 2019 18:10:43 +0000
Message-ID: <bb88e890-84c4-5405-85c6-59f02d5a7a61@amd.com>
References: <1559717076-25471-1-git-send-email-Monk.Liu@amd.com>
 <MN2PR12MB393308FE408E9E41EF0D615184160@MN2PR12MB3933.namprd12.prod.outlook.com>
 <8dbf96e5-056f-b2bb-b0d3-9376b92b0140@amd.com>
 <MN2PR12MB39334AC8143DDBC1AA7587E884160@MN2PR12MB3933.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB39334AC8143DDBC1AA7587E884160@MN2PR12MB3933.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P195CA0106.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::47) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe2664e7-b24f-4d99-c475-08d6e9e11fff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1132; 
x-ms-traffictypediagnostic: DM5PR12MB1132:
x-microsoft-antispam-prvs: <DM5PR12MB1132956479803BD6F3293D5583160@DM5PR12MB1132.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(366004)(346002)(376002)(13464003)(189003)(199004)(6116002)(6246003)(64756008)(2906002)(86362001)(66446008)(81156014)(66556008)(8936002)(73956011)(53936002)(66476007)(386003)(14444005)(81166006)(2616005)(8676002)(31686004)(71190400001)(256004)(2501003)(478600001)(446003)(7736002)(71200400001)(305945005)(476003)(64126003)(65806001)(65956001)(31696002)(486006)(68736007)(11346002)(46003)(5660300002)(14454004)(25786009)(36756003)(6486002)(66946007)(186003)(65826007)(72206003)(229853002)(52116002)(316002)(53546011)(58126008)(6506007)(110136005)(76176011)(102836004)(99286004)(6436002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1132;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BVVHW26BaZtybqk93pJZ0sNZlid+ahhuBVTz3Z8YQ3i+XNs/0HZqffYbZBcdFTo9j606wG85cLwcVunAOjOUJ2Cv1Zn2VuzR6UFOiw27JAE/BwAVqbBU+XLdGqheuU3beNyyLhM5LDfdgJDDxYQlUTp8QNz+dBmATB+PFIjjo/snKlAGAkAAez/WuO/izCCIK5adPLErJHsedYWVg3KolDpthcP2giFqJNRyvOLgYO8aJpGBsKVWy19vrEVEdiT7qK2gp7YuS5jIF9kco/BY3EGYkH1GXEq4CcCByIf6HFE2TWbMPrbupYnsKpmtfr6ehOILdncG/CIMeDqIoG211YGFFbcuDNrWiRTTbrKPNnt/ur8hs/yQOSZj/r+zXueK6NE7ubrJuLxbbGn7UWHxXDpH8KiIJc6CUwGLlr2Jw0s=
Content-ID: <53A1408118700B4A842F91D2C1EF3070@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2664e7-b24f-4d99-c475-08d6e9e11fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 18:10:43.6295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9Wx6nAWdIU3U4oJBNcSqg39B28JtQymcLeWPFJB+cM=;
 b=ciGd5dYBeQUWhDfhEdZa/dpZRvX9NXhF+wNHijdB9V/UPWT+ABuk3TB6d31odfhss1tkgx5n8FXwBFEUYFV5IqijRznv1U313iorEO2tCfA6IVFw/LTA3n0bHkW9vLaPD18Z7SXEg8cX5boMPtXPrOeyYcAzUUPoXV3f8JE3ncg=
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

TWhtLCBsb29rcyBsaWtlIHRoYXQgc29tZWhvdyBnb3QgZHJvcHBlZCBkdXJpbmcgcmViYXNlLg0K
DQpHb2luZyB0byBkaWcgdXAgd2hlcmUgdGhhdCBhY3R1YWxseSBlbmRlZCB1cCB0b21vcnJvdy4N
Cg0KQ2hyaXN0aWFuLg0KDQpBbSAwNS4wNi4xOSB1bSAxNjo0NCBzY2hyaWViIExpdSwgTW9uazoN
Cj4gU3RyYW5nZSwgSSBnZXQgdGhlIGxhdGVzdCAiZHJtLW5leHQiIGJyYW5jaCBhbmQgZGlkbid0
IHNlZSB0aGUgY2hhbmdlIGxhbmRlZCAuLi4uDQo+DQo+IC9Nb25rDQo+DQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtvZW5pZywgQ2hyaXN0aWFuDQo+IFNlbnQ6IFdlZG5l
c2RheSwgSnVuZSA1LCAyMDE5IDc6MTEgUE0NCj4gVG86IExpdSwgTW9uayA8TW9uay5MaXVAYW1k
LmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBGVzog
W1BBVENIXSBkcm0vdHRtOiBmaXggdHRtIGNsaWVudCBkcml2ZXIgKGUuZy4gYW1kZ3B1KSByZWxv
YWQgaXNzdWUNCj4NCj4gVGhpcyBzaG91bGQgYWxyZWFkeSBiZSBmaXhlZCBieSBwYXRjaCAiZHJt
L3R0bTogZml4IHJlLWluaXQgb2YgZ2xvYmFsIHN0cnVjdHVyZXMiLg0KPg0KPiBDaHJpc3RpYW4u
DQo+DQo+IEFtIDA1LjA2LjE5IHVtIDA5OjI5IHNjaHJpZWIgTGl1LCBNb25rOg0KPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29t
Pg0KPj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDUsIDIwMTkgMjo0NSBQTQ0KPj4gVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBDYzogTGl1LCBNb25rIDxNb25rLkxpdUBhbWQu
Y29tPg0KPj4gU3ViamVjdDogW1BBVENIXSBkcm0vdHRtOiBmaXggdHRtIGNsaWVudCBkcml2ZXIg
KGUuZy4gYW1kZ3B1KSByZWxvYWQNCj4+IGlzc3VlDQo+Pg0KPj4gbmVlZCB0byBjbGVhciBibyBn
bG9iIGFuZCBtZW0gZ2xvYiBkdXJpbmcgdGhlaXIgcmVsZWFzZSBvdGhlcndpc2UgdGhlaXIgbWVt
YmVyIHZhbHVlIHdvdWxkIGJlIHdyb25nbHkgdXNlZCBpbiB0aGUgbmV4dCBnbG9iIGluaXQgc3Rh
Z2UgYW5kIGxlYWQgdG8gd2lsZCBwb2ludGVyIGFjY2VzcyBwcm9ibGVtczoNCj4+DQo+PiAxKSBr
b2JqLnN0YXRlX2luaXRpYWxpemVkIGlzIDENCj4+IDIpIHR0bV9ib19nbG9iLmJvX2NvdW50IGlz
bid0IGNsZWFyZWQgYW5kIHJlZmVyZW5jZWQgdmlhIGl0DQo+PiAgICAgIG9uIG1lbWJlciAic3dh
cF9scnUiIHdvdWxkIGhpdCBvdXQgb2YgYm91bmQgYXJyYXkgYWNjZXNzaW5nDQo+PiAgICAgIGJ1
Zw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPg0KPj4g
LS0tDQo+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jICAgICB8IDIgKysNCj4+ICAg
IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21lbW9yeS5jIHwgOCArKysrKysrKw0KPj4gICAgMiBm
aWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YyBpbmRleCBjN2RlNjY3Li42NDM0ZWFjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPj4g
QEAgLTE2MDQsNiArMTYwNCw4IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19nbG9iYWxfa29ial9yZWxl
YXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKQ0KPj4gICAgCQljb250YWluZXJfb2Yoa29iaiwgc3Ry
dWN0IHR0bV9ib19nbG9iYWwsIGtvYmopOw0KPj4gICAgDQo+PiAgICAJX19mcmVlX3BhZ2UoZ2xv
Yi0+ZHVtbXlfcmVhZF9wYWdlKTsNCj4+ICsNCj4+ICsJbWVtc2V0KGdsb2IsIDAsIHNpemVvZigq
Z2xvYikpOw0KPj4gICAgfQ0KPj4gICAgDQo+PiAgICBzdGF0aWMgdm9pZCB0dG1fYm9fZ2xvYmFs
X3JlbGVhc2Uodm9pZCkgZGlmZiAtLWdpdA0KPj4gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9t
ZW1vcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21lbW9yeS5jDQo+PiBpbmRleCA4NjE3
OTU4Li43MTI4YmJmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbWVt
b3J5LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21lbW9yeS5jDQo+PiBAQCAt
MjI5LDkgKzIyOSwxNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN5c2ZzX29wcyB0dG1fbWVtX2ds
b2JhbF9vcHMgPSB7DQo+PiAgICAJLnN0b3JlID0gJnR0bV9tZW1fZ2xvYmFsX3N0b3JlLA0KPj4g
ICAgfTsNCj4+ICAgIA0KPj4gK3ZvaWQgdHRtX21lbV9nbG9iX2tvYmpfcmVsZWFzZShzdHJ1Y3Qg
a29iamVjdCAqa29iaikgew0KPj4gKwlzdHJ1Y3QgdHRtX21lbV9nbG9iYWwgKmdsb2IgPSBjb250
YWluZXJfb2Yoa29iaiwgc3RydWN0DQo+PiArdHRtX21lbV9nbG9iYWwsIGtvYmopOw0KPj4gKw0K
Pj4gKwltZW1zZXQoZ2xvYiwgMCwgc2l6ZW9mKCpnbG9iKSk7DQo+PiArfQ0KPj4gKw0KPj4gICAg
c3RhdGljIHN0cnVjdCBrb2JqX3R5cGUgdHRtX21lbV9nbG9iX2tvYmpfdHlwZSA9IHsNCj4+ICAg
IAkuc3lzZnNfb3BzID0gJnR0bV9tZW1fZ2xvYmFsX29wcywNCj4+ICAgIAkuZGVmYXVsdF9hdHRy
cyA9IHR0bV9tZW1fZ2xvYmFsX2F0dHJzLA0KPj4gKwkucmVsZWFzZSA9IHR0bV9tZW1fZ2xvYl9r
b2JqX3JlbGVhc2UsDQo+PiAgICB9Ow0KPj4gICAgDQo+PiAgICBzdGF0aWMgYm9vbCB0dG1fem9u
ZXNfYWJvdmVfc3dhcF90YXJnZXQoc3RydWN0IHR0bV9tZW1fZ2xvYmFsICpnbG9iLA0KPj4gLS0N
Cj4+IDIuNy40DQo+Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
