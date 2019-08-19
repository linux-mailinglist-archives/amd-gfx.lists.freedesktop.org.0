Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C472491E53
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 09:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123646E0AD;
	Mon, 19 Aug 2019 07:53:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800084.outbound.protection.outlook.com [40.107.80.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE656E0AD
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 07:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COGfQNhxhg7Lyu+1Q8rDXt119zNhgNxjBXYsLNN7FHUk9EKwJjXHYRTJP4DBNCGHrSQgWfYgsfpK7fOS8HP8YKtAuApgGBSjCaPoKhrOpKZjZFb+XgpbPuyYMVVk/mF1VcXyXuDXlRNkUgRFjwim8XcP1C+f/gO8055MaY21sXPDS2PnTrLSHG6X4tv3cxzjw/YsPEbKsz2ZMZ01jtfGO5hQzv+pbmoQ5XepraiNpFwpE2aHCOnx/9NQSJEdaVWsZVJGMZ5/jPABLyyXxdLzjqCVYwhlQs0YplTKCG+y7VhXDeulT3GtLPAQhCs0uXpGC/hC+QQwRNrN5zjp2zlWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=if1uUsQjanJfez4Y2c4PfDBPIhRZ1/jG95455Lersj0=;
 b=W1djiZ+3BboTFzIhNKY+lM/wVcfvpJ/pvrSYSEGvPJ47y6mkDzjcl9GFB+ZEYxWRi04pnFserqN1+8+nYiF6Ive7kudbshcsWK626cqnFrjGCI+jaP5vueejv+9LCLwfCpMWzCeb05lsByHBWeFOFfdoNKb4xKU9aKd2eEFElQU3jlQ/btpWEdz5AnAZGhWxJfveLnESwkkr3UKJ2JGILmX1xkAxem0VL8dgoZXq+rF922uxq8sTo6nvgBF1yZpaTz3LH6jkJkGGKhmyK1jB26zRP2jO2/GXuB1GhW39alWV4kZmC5cHBV8BLj0uZl+k6/YKvkIm/ZSf53EJwOHK5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1177.namprd12.prod.outlook.com (10.168.233.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 07:53:19 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 07:53:19 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Cui, Flora" <Flora.Cui@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>
Subject: Re: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
Thread-Topic: [PATCH libdrm] amdgpu: add mmhub ras inject unit test
Thread-Index: AQHVVCJkTXF7fKGGD0y9yrf7bEc/4Kb9np0AgAQvmsCAAETggIAAAp/wgAAIUQA=
Date: Mon, 19 Aug 2019 07:53:19 +0000
Message-ID: <ec1684a8-c64c-6df5-aa87-9f376d7234ae@amd.com>
References: <20190816110401.11069-1-guchun.chen@amd.com>
 <b6cde318-e453-8a89-095c-69708f0981ef@gmail.com>
 <BYAPR12MB280662C3A47CA31DC1790A3AF1A80@BYAPR12MB2806.namprd12.prod.outlook.com>
 <59701e8a-cc27-95d7-97f3-2d5867d0bc40@amd.com>
 <BYAPR12MB2806E142EFAE7C395A7F60D1F1A80@BYAPR12MB2806.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB2806E142EFAE7C395A7F60D1F1A80@BYAPR12MB2806.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MRXP264CA0029.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::17) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77ba6e6d-251a-4747-100e-08d7247a4ce9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1177; 
x-ms-traffictypediagnostic: DM5PR12MB1177:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1177311EE93537398C085B5A83A80@DM5PR12MB1177.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(199004)(189003)(52314003)(13464003)(2616005)(486006)(99286004)(305945005)(446003)(476003)(229853002)(8936002)(11346002)(8676002)(76176011)(66574012)(71190400001)(81156014)(6436002)(53546011)(31696002)(386003)(46003)(6486002)(86362001)(186003)(6506007)(71200400001)(36756003)(52116002)(256004)(81166006)(7736002)(65826007)(64126003)(66556008)(66946007)(65806001)(5660300002)(4326008)(65956001)(66476007)(25786009)(66446008)(6512007)(102836004)(110136005)(478600001)(58126008)(64756008)(2501003)(6116002)(6636002)(53936002)(14454004)(2906002)(316002)(31686004)(6246003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1177;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xffHbWOyNC09+vpe9egBOzmx23SYkjqhxgEL+MrAqjNdPrpHbx1+srZQYXTwJDMD1vQNQqNaT+4J1wEUAzGHolLmG38JVKUAItX/URrjQ6fTPJhUwp2gryDdctPWH3pVioOd9LRT+VDeHl4p6qDtZRGtmCnP6ZCxAA2zO5o0Cwm4qdxYeoHfZTv/TXvRnN/1c/gaC175OjBK+IHVXTgJGG0/rIkDmd3DBfYZD6ejnfL4tvgmVo/j8H+2gCSMzvdyG3GOYyJ5bMbgsyBNa2b1vNNH6R//yecNe4WlA81twLlS7fnnZFwNwH3Hdz0PpDX5GHl1pmZQTiKAEOYWj+k+0d8ltzakptzJzBb8JxnAhddNFxyVXNt3kvnM6I88yGAzTrGHfEKdYDhsywb/aDXZY2075IQR+O5h2O8YJjE4qVI=
Content-ID: <4F25EB9108732248B2FA1A50AEB7884D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ba6e6d-251a-4747-100e-08d7247a4ce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 07:53:19.3006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0mv2vh9O5oiR+klcivW5MgqD76eVlv+GFOCfvbNSoFnMWq4P4UXmA9yBeLdX+OZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1177
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=if1uUsQjanJfez4Y2c4PfDBPIhRZ1/jG95455Lersj0=;
 b=YvdHj5/TzGwEa1b3WuG7udp9FZheprLpCimKY7Hnxokc+KwMUhM+LncW8yaSBqzh2zLM0UKZ+WRo1RSTcqoMBpWNCoSHBjVXrp4xkyHEytWXyp1GdfoPuaevgi1nsr89qYoj8hkcb3c2oFMHxOXL7hWNU5W9r0h8d9DludMuWuM=
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
Cc: "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgR3VjaHVuLA0KDQo+IFB1dCBhbGwgdGVzdHMgaW4gYyBjb2RlLCBhbmQgZXh0ZW5kIHRoZSBh
cmdzIHdoZW4gcnVubmluZyBhbWRncHVfdGVzdCwgd2hpY2ggd2lsbCBhbGxvdyB1c2VyIGNhbiBy
dW4gc3BlY2lhbCBSQVMgdGVzdC4NCkFoISBTb3VuZHMgbGlrZSB3ZSBoYXZlIGp1c3QgYSBtaXN1
bmRlcnN0YW5kaW5nIGhlcmUuIEFzIGZhciBhcyBJIGtub3cgDQp3ZSBhbHJlYWR5IGhhdmUgdGhl
IGZ1bmN0aW9uYWxpdHkgdG8gc2VsZWN0IG9ubHkgc3BlY2lmaWMgdGVzdHMgdG8gcnVuIA0KZnJv
bSB0aGUgY29tbWFuZCBsaW5lIG9mIGFtZGdwdV90ZXN0Lg0KDQpUaGF0J3MgYWN0dWFsbHkgdGhl
IGJhY2tncm91bmQgcmVhc29uIHdoeSB3ZSB1c2UgdGhlIENVbml0IGZyYW1ld29yay4NCg0KSSBo
YXZlbid0IHVzZWQgdGhhdCBmdW5jdGlvbmFsaXR5IGluIGEgbG9uZyB0aW1lLCBjb3VsZCBiZSB0
aGF0IGl0IGlzIA0KYnJva2VuIG9yIHNvbWV0aGluZy4gQnV0IGF0IGxlYXN0IGluIHRoZW9yeSBp
dCBzaG91bGQgYmUgdGhlcmUuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCkFtIDE5LjA4LjE5
IHVtIDA5OjQ4IHNjaHJpZWIgQ2hlbiwgR3VjaHVuOg0KPiBIaSBDaHJpc3RpYW4sDQo+DQo+IFRo
YW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KPiBSZWdhcmRpbmcgdGhlIGNvbmZpZ3VyYXRpb24g
ZmlsZSBtb3ZpbmcgdG8gdGVzdC9hbWRncHUsIEkgYW0gZmluZSB3aXRoIHRoaXMuDQo+DQo+IEJ1
dCByZWcgcHV0dGluZyBhbGwgdGhlIHRlc3RzIGluIEMgY29kZSwgdGhvdWdoIGl0IGxvb2tzIGxp
a2UgdGhlIHVuaXQgdGVzdCBjYW4gc3RheSBzZWxmIGNvbnRhaW5pbmcsIGJ1dCB3aXRob3V0IG9u
ZSBpbmRlcGVuZGVudCBjb25maWd1cmF0aW9uIGZpbGUsIHVzZXIgd2lsbCBmaW5kIGl0J3MgaW5j
b252ZW5pZW50IHdoZW4gcGVyZm9ybWluZyB0aGUgdGVzdHMuDQo+IEZvciBleGFtcGxlLCBpZiB3
ZSBtb3ZlIGFsbCBSQVMgaW5qZWN0IHRlc3RzIGludG8gQyBjb2RlLCBob3dldmVyLCBpZiB0aGUg
dXNlciBvbmx5IGNhcmVzIHRoZSBSQVMgdW5pdCB0ZXN0IGluIGNlcnRhaW4gbW9kdWxlL3N1Ym1v
ZHVsZSB0ZXN0LCBoZS9zaGUgd291bGQgbm90IGxpa2UgdG8gc2VlIGluamVjdCB0ZXN0cyBpbiBh
bGwgbW9kdWxlcyBydW4gYWZ0ZXIgbGF1bmNoaW5nIGFtZGdwdV90ZXN0LCBzbyBpdCdzIG5vdCBm
cmllbmRseSB0byB1c2VyLg0KPiBBbnl3YXksIHlvdXIgc3VnZ2VzdGlvbiBzdGlsbCBtYWtlcyBz
ZW5zZSwgYXMgYW1kZ3B1X3Rlc3Qgc2hvdWxkIGdldCByaWQgb2Ygb3RoZXIgZXh0ZXJuYWwgcGFj
a2FnZXMgZXhjZXB0IENVbml0IGZyYW1ld29yay4NCj4NCj4gU28gd2Ugc3RpbGwgdGhlIGJhbGFu
Y2UgYmV0d2VlbiBhYm92ZSB0d28gY2FzZXM6DQo+IDEuIE1ha2UgYW1kZ3B1X3Rlc3Qgc2VsZiBj
b250YWluaW5nIHdpdGhvdXQgZGVwZW5kZW5jeSBvbiBvdGhlciBleHRlcm5hbCBwYWNrYWdlcy4N
Cj4gMi4gQWxsb3cgdXNlciBjYW4gY29uZmlndXJlIHRoZSB0ZXN0cyB3aGVuIHJ1bm5pbmcgYW1k
Z3B1X3Rlc3QuDQo+DQo+IFRoZW4gdGhlIHBvc3NpYmxlIHNvbHV0aW9ucyBJIGNhbiBpbGx1c3Ry
YXRlIGFyZToNCj4gMS4gU3RpbGwga2VlcCBvbmUgY29uZmlndXJhdGlvbiBmaWxlLCBidXQgbm90
IGluIGpzb24gZm9ybWF0LiBJdOKAmXMgYSBub3JtYWwgY29uZmlndXJhdGlvbiBmaWxlLCB3ZSB3
aWxsIGFkZCBjb2RlIGluIGFtZGdwdV90ZXN0IHRvIHBhcnNlIHRoZSBjb25maWd1cmF0aW9uIGZp
bGUsIGFuZCByZW1vdmUgYWxsIGpzb24gQVBJcy4NCj4gMi4gUHV0IGFsbCB0ZXN0cyBpbiBjIGNv
ZGUsIGFuZCBleHRlbmQgdGhlIGFyZ3Mgd2hlbiBydW5uaW5nIGFtZGdwdV90ZXN0LCB3aGljaCB3
aWxsIGFsbG93IHVzZXIgY2FuIHJ1biBzcGVjaWFsIFJBUyB0ZXN0Lg0KPg0KPiBJIGFtIG9wZW5l
ZCB0byBhYm92ZSB0d28gc29sdXRpb25zIG9yIG90aGVyIG1pc3NlZCBvbmVzLg0KPg0KPiBSZWdh
cmRzLA0KPiBHdWNodW4NCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
S29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBBdWd1c3QgMTksIDIwMTkgMzoxNCBQTQ0KPiBUbzogQ2hlbiwgR3VjaHVuIDxHdWNodW4u
Q2hlbkBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBIYXdr
aW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBMaSwgRGVubmlzIDxEZW5uaXMuTGlAYW1kLmNv
bT47IEN1aSwgRmxvcmEgPEZsb3JhLkN1aUBhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3Ux
QGFtZC5jb20+DQo+IENjOiBMaSwgQ2FuZGljZSA8Q2FuZGljZS5MaUBhbWQuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIGxpYmRybV0gYW1kZ3B1OiBhZGQgbW1odWIgcmFzIGluamVjdCB1bml0
IHRlc3QNCj4NCj4gSGkgR3VjaHVuLA0KPg0KPiBpbiB0aGlzIGNhc2UgdGhpcyBpcyBhIGJpdCBh
d2t3YXJkIGltcGxlbWVudGVkLg0KPg0KPiBTZWUgdGhlIGZpbGVzIGluIHRoZSBkYXRhIGRpcmVj
dG9yeSBhcmUgZm9yIGluc3RhbGxhdGlvbiB0b2dldGhlciB3aXRoIHRoZSBsaWJkcm0gbGlicmFy
eSBhbmQgTk9UIGZvciB0aGUgdW5pdCB0ZXN0cy4gUGxlYXNlIG1vdmUgdGhlIGZpbGUgdG8gdGVz
dHMvYW1kZ3B1IGluc3RlYWQuDQo+DQo+IEkgd291bGQgYWxzbyByZS1jb25zaWRlciB0aGlzIGFw
cHJvYWNoIHNpbmNlIHdlIGludGVudGlvbmFsbHkgdXNlIHRoZSBDVW5pdCBmcmFtZXdvcmsgdG8g
YXZvaWQgZGVwZW5kZW5jaWVzIG9uIGV4dGVybmFsIGxpYnJhcmllcyBsaWtlIGpzb24gYW5kIGV4
dGVybmFsIGZpbGVzLg0KPg0KPiBXZSBzaG91bGQgcHJvYmFibHkgYmV0dGVyIGNvbmZpZ3VyZSB0
aGUgdGVzdHMgZGlyZWN0bHkgaW4gdGhlIEMgY29kZSBzbyB0aGF0IHRoZSB1bml0IHRlc3Qgc3Rh
eXMgc2VsZiBjb250YWluaW5nLg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+DQo+IEFt
IDE5LjA4LjE5IHVtIDA1OjE2IHNjaHJpZWIgQ2hlbiwgR3VjaHVuOg0KPj4gSGkgQ2hyaXN0aWFu
LA0KPj4NCj4+IFllcywgd2UgYWRkZWQgb25lIGNvbmZpZ3VyYXRpb24gZmlsZSBuYW1lZCAiYW1k
Z3B1X3Jhcy5qc29uIiBmb3IgUkFTIGluamVjdCB1bml0IHRlc3QgdG8gZHJtIG1hc3RlciBicmFu
Y2guDQo+PiBUaGlzIHVuaXQgdGVzdCB3aWxsIGJlIG1haW50YWluZWQgdG8gaWxsdXN0cmF0ZSBh
bGwgdGhlIFJBUyB0ZXN0cyB3ZSBhYnNvbHV0ZWx5IHN1cHBvcnQgaW4gSVAgbW9kdWxlcy9zdWJt
b2R1bGVzLg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBHdWNodW4NCj4+DQo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPj4gRnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+DQo+PiBTZW50OiBGcmlkYXksIEF1Z3VzdCAxNiwgMjAxOSA3OjEy
IFBNDQo+PiBUbzogQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPjsgYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+PiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0Bh
bWQuY29tPjsgTGksIERlbm5pcw0KPj4gPERlbm5pcy5MaUBhbWQuY29tPjsgQ3VpLCBGbG9yYSA8
RmxvcmEuQ3VpQGFtZC5jb20+OyBaaG91MSwgVGFvDQo+PiA8VGFvLlpob3UxQGFtZC5jb20+DQo+
PiBDYzogTGksIENhbmRpY2UgPENhbmRpY2UuTGlAYW1kLmNvbT4NCj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggbGliZHJtXSBhbWRncHU6IGFkZCBtbWh1YiByYXMgaW5qZWN0IHVuaXQgdGVzdA0KPj4N
Cj4+IFdlbGwgdGhpcyBkb2Vzbid0IGxvb2sgbGlrZSBDIHRvIG1lLiBEaWQgd2UgYWRkZWQgYSBj
b25maWd1cmF0aW9uIGZpbGUgZm9yIHRoZSByYXMgdW5pdCB0ZXN0cyBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Pw0KPj4NCj4+IENocmlzdGlhbi4NCj4+DQo+PiBBbSAxNi4wOC4xOSB1bSAxMzowNCBz
Y2hyaWViIEd1Y2h1biBDaGVuOg0KPj4+IENoYW5nZS1JZDogSWE3NmI5NTE2MmY1ZjZmNDE5Zjcw
YjUzZWY0NDNiY2VhZjJlMDkyZTANCj4+PiBTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3Vj
aHVuLmNoZW5AYW1kLmNvbT4NCj4+PiAtLS0NCj4+PiAgICAgZGF0YS9hbWRncHVfcmFzLmpzb24g
fCAxMCArKysrKysrKysrDQo+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZGF0YS9hbWRncHVfcmFzLmpzb24gYi9kYXRhL2FtZGdw
dV9yYXMuanNvbiBpbmRleA0KPj4+IDI2ZmQ5NDY1Li40ODRmMTJmMiAxMDA2NDQNCj4+PiAtLS0g
YS9kYXRhL2FtZGdwdV9yYXMuanNvbg0KPj4+ICsrKyBiL2RhdGEvYW1kZ3B1X3Jhcy5qc29uDQo+
Pj4gQEAgLTEyMSw2ICsxMjEsOSBAQA0KPj4+ICAgICAgICAgICAgICAgICAgICAgInV0Y19hdGNs
Ml9jYWNoZV80a19iYW5rIjogMTExDQo+Pj4gICAgICAgICAgICAgICAgIH0NCj4+PiAgICAgICAg
ICAgICB9LA0KPj4+ICsgICAgICAgICJtbWh1YiI6IHsNCj4+PiArICAgICAgICAgICAgImluZGV4
IjogMw0KPj4+ICsgICAgICAgIH0sDQo+Pj4gICAgICAgICB9LA0KPj4+ICAgICAgICAgInR5cGUi
OiB7DQo+Pj4gICAgICAgICAgICAgInBhcml0eSI6IDEsDQo+Pj4gQEAgLTI2Myw1ICsyNjYsMTIg
QEANCj4+PiAgICAgICAgICAgICAgICAgImFkZHJlc3MiOiAwLA0KPj4+ICAgICAgICAgICAgICAg
ICAidmFsdWUiOiAwDQo+Pj4gICAgICAgICAgICAgfSwNCj4+PiArICAgICAgICB7DQo+Pj4gKyAg
ICAgICAgICAgICJuYW1lIjogInJhc19tbWh1Yi4xLjAiLA0KPj4+ICsgICAgICAgICAgICAiYmxv
Y2siOiAibW1odWIiLA0KPj4+ICsgICAgICAgICAgICAidHlwZSI6ICJzaW5nbGVfY29ycmVjdGFi
bGUiLA0KPj4+ICsgICAgICAgICAgICAiYWRkcmVzcyI6IDAsDQo+Pj4gKyAgICAgICAgICAgICJ2
YWx1ZSI6IDANCj4+PiArICAgICAgICB9LA0KPj4+ICAgICAgICAgXQ0KPj4+ICAgICB9DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
