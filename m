Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D53D125C
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 17:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F576E9D9;
	Wed,  9 Oct 2019 15:25:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CAD6E9D2;
 Wed,  9 Oct 2019 15:25:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+9YaJJaquxkqj88zAYAk6WwuleO3616p8uXF7B/Y8EXPUygOBNOdHLA+wMr+/WCyYrchvtG1aKCZ0DCJPnYwnqUfOZI4vK2QDuyir6o63jTLA0B4FQQx4guQ+oXs3B8JoQYwqRwEPMnAW9JtGA0FDWbXr4TuJEunNr9lZ/uo3OahGHG1TI4uDL0JE5s1UVPXiZPKX8j1ieZ48/G5cggQzdx+ZP4bevDa8G1D83cwoOXC3lvCcAwdpojszT3h4kVMa3y5pNwU/HUBz13aS4oblF8klyHXzqSwhVmy5imh8leSvlEWcwbiZZyuqNkRv+24QQJZqjzW44IrQAIRaVODA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJe4WDrSI1nO9Kp6v3BgIoP17ApARY+pvHFwGP+f6Fw=;
 b=oSjZO33sXHnXx7tVJGEH+bkm9ELa7E2dK6hO5d9UiG50VCmXrDBeCJn6DKLb3ExWyMwj6MLevHy5E63DuDoJGVWalLp5fKemhkIf3I1BUIVhYTolK9mb2mKx/WuaDwKf3DNIj19C15Du3DzwwIqjFvmaSfquFh7RWCrImXGYpTc7mPW+RN2QdH15iYsqr8l3f2pU6gilsTGAA6cFl5QknnN/8HpbX7DD5UOZnAqsZvy4m2dqHJurex5lIcmyMbHpfPv07HOr3R/MP0uP2I/GMYeIpgxTW/Kuzw0ypmz9jdcF6JqlfdzSLt167moHySJdDED71X6F26XTKwFAIFJ/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3546.namprd12.prod.outlook.com (20.179.106.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 15:25:22 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::e56a:1c63:d6bd:8034%4]) with mapi id 15.20.2327.025; Wed, 9 Oct 2019
 15:25:22 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RFC v4 14/16] drm, cgroup: Introduce lgpu as DRM cgroup
 resource
Thread-Topic: [PATCH RFC v4 14/16] drm, cgroup: Introduce lgpu as DRM cgroup
 resource
Thread-Index: AQHVXi/h1oN2voIWJ0+QRhZYbzbb9adRVuiAgAEGQICAAFH9AA==
Date: Wed, 9 Oct 2019 15:25:22 +0000
Message-ID: <ee873e89-48fd-c4c9-1ce0-73965f4ad2ba@amd.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-15-Kenny.Ho@amd.com>
 <b3d2b3c1-8854-10ca-3e39-b3bef35bdfa9@amd.com>
 <20191009103153.GU16989@phenom.ffwll.local>
In-Reply-To: <20191009103153.GU16989@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [142.116.62.69]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTXPR0101CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::33) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d92ff66-a5fb-44c5-8289-08d74ccce6a5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3546:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB35467B9E92809EDDE320317C92950@DM6PR12MB3546.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(199004)(189003)(6116002)(25786009)(6916009)(3846002)(58126008)(30864003)(4326008)(2906002)(5660300002)(6246003)(54906003)(6436002)(229853002)(8676002)(81166006)(81156014)(7736002)(6486002)(305945005)(8936002)(6512007)(316002)(66066001)(66946007)(186003)(2616005)(65806001)(31696002)(14454004)(446003)(26005)(11346002)(476003)(31686004)(66556008)(102836004)(36756003)(478600001)(66476007)(486006)(14444005)(256004)(64756008)(86362001)(66446008)(99286004)(71190400001)(71200400001)(76176011)(52116002)(386003)(6506007)(53546011)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3546;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XH/uBXirLHFCBcWWKw7+VWO/VpFVDFVY+xRIIbAD8QfgETB9ouVgNDC0jVBWRPcHEERriugdtlMYLrFASUoNZdpOHOB7hZmHnOY97zQLdtF7yNg4/cyk2INTmxFUjSTZlwQtvcqmXxJlt4PHx0mYQHid1Yxv9b7F2ojhNiyNKJO1Wy50yptPWBzpmObY9bhBqSZlwG9g8pr0YA2RfMxYxaehEFbANWklhKp5DK+jBHTPMKnK2cwGMDUIGwVQReO0vp8yPZjD/mlK9kM1MvumaZtHLw7+Roavt+Brs8tYnSZaI069rQpnDOfYU4L9QhmG+/4X8xZ8OcvJhueG70lbgpKRo0U5vkn0a/J85zo+Y9yZMZlQS2JWB7+mkrlFqAcrssCn+rrz4E39L3MN3qdH9iS5IAcHxYXNEGlzOEFWjwc=
Content-ID: <3C3816BCFD3D3C4FBF258F50A37F6BC5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d92ff66-a5fb-44c5-8289-08d74ccce6a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 15:25:22.5558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T/pI2ocmdlsol9/QnqgOf4k5sk30WZlzEMGTeVASy26nF8t/inNyP3gXk1Pn2OLPgTQscbwI59EnU+F9niFHXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3546
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJe4WDrSI1nO9Kp6v3BgIoP17ApARY+pvHFwGP+f6Fw=;
 b=1OroX7KkX9jr1ULdDwFaPaoRwtOvLy0z4uAV5UaCyOdTWcvPeaKaTcNevHenwQi60gybKmhzh4Obs/3lER1rpfNuRV3cZfwA2R/LRgBhPBJ5E0TmYJtvkXEIvGfSoonwmWycj14XNiuYYLRR5fKCadWiCF1fP5u/TAxil+Zzfds=
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
Cc: "Ho, Kenny" <Kenny.Ho@amd.com>, "jsparks@cray.com" <jsparks@cray.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "lkaplan@cray.com" <lkaplan@cray.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "y2kenny@gmail.com" <y2kenny@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
 "tj@kernel.org" <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wOSA2OjMxLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPiBPbiBUdWUsIE9jdCAw
OCwgMjAxOSBhdCAwNjo1MzoxOFBNICswMDAwLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+Pg0K
Pj4gVGhlIGRlc2NyaXB0aW9uIHNvdW5kcyByZWFzb25hYmxlIHRvIG1lIGFuZCBtYXBzIHdlbGwg
dG8gdGhlIENVIG1hc2tpbmcNCj4+IGZlYXR1cmUgaW4gb3VyIEdQVXMuDQo+Pg0KPj4gSXQgd291
bGQgYWxzbyBhbGxvdyB1cyB0byBkbyBtb3JlIGNvYXJzZS1ncmFpbmVkIG1hc2tpbmcgZm9yIGV4
YW1wbGUgdG8NCj4+IGd1YXJhbnRlZSBiYWxhbmNlZCBhbGxvY2F0aW9uIG9mIENVcyBhY3Jvc3Mg
c2hhZGVyIGVuZ2luZXMgb3INCj4+IHBhcnRpdGlvbmluZyBvZiBtZW1vcnkgYmFuZHdpZHRoIG9y
IENQIHBpcGVzIChpZiB0aGF0IGlzIHN1cHBvcnRlZCBieQ0KPj4gdGhlIGhhcmR3YXJlL2Zpcm13
YXJlKS4NCj4gSG0sIHNvIHRoaXMgc291bmRzIGxpa2UgdGhlIGRlZmluaXRpb24gZm9yIGhvdyB0
aGlzIGNncm91cCBpcyBzdXBwb3NlZCB0bw0KPiB3b3JrIGlzICJhbWQgQ1UgbWFza2luZyIgKHdo
YXRldmVyIHRoYXQgZXhhY3RseSBpcykuIEFuZCB0aGUgYWJzdHJhY3QNCj4gZGVzY3JpcHRpb24g
aXMganVzdCBwcmV0dGlmaWNhdGlvbiBvbiB0b3AsIGJ1dCBub3QgYWN0dWFsbHkgdGhlIHJlYWwN
Cj4gZGVmaW5pdGlvbiB5b3UgZ3V5cyB3YW50Lg0KDQpJIHRoaW5rIHlvdSdyZSByZWFkaW5nIHRo
aXMgYXMgdGhlIG9wcG9zaXRlIG9mIHdoYXQgSSB3YXMgdHJ5aW5nIHRvIHNheS4gDQpVc2luZyBD
VSBtYXNraW5nIGlzIG9uZSBwb3NzaWJsZSBpbXBsZW1lbnRhdGlvbiBvZiBMR1BVcyBvbiBBTUQg
DQpoYXJkd2FyZS4gSXQncyB0aGUgb25lIHRoYXQgS2VubnkgaW1wbGVtZW50ZWQgYXQgdGhlIGVu
ZCBvZiB0aGlzIHBhdGNoIA0Kc2VyaWVzLCBhbmQgSSBwb2ludGVkIG91dCBzb21lIHByb2JsZW1z
IHdpdGggdGhhdCBhcHByb2FjaC4gT3RoZXIgd2F5cyANCnRvIHBhcnRpdGlvbiB0aGUgaGFyZHdh
cmUgaW50byBMR1BVcyBhcmUgY29uY2VpdmFibGUuIEZvciBleGFtcGxlIHdlJ3JlIA0KY29uc2lk
ZXJpbmcgc3BsaXR0aW5nIGl0IGFsb25nIHRoZSBsaW5lcyBvZiBzaGFkZXIgZW5naW5lcywgd2hp
Y2ggaXMgDQptb3JlIGNvYXJzZS1ncmFpbiBhbmQgd291bGQgYWxzbyBhZmZlY3QgbWVtb3J5IGJh
bmR3aWR0aCBhdmFpbGFibGUgdG8gDQplYWNoIHBhcnRpdGlvbi4NCg0KV2UgY291bGQgYWxzbyBj
b25zaWRlciBwYXJ0aXRpb25pbmcgcGlwZXMgaW4gb3VyIGNvbW1hbmQgcHJvY2Vzc29yLCANCmFs
dGhvdWdoIHRoYXQgaXMgbm90IHN1cHBvcnRlZCBieSBvdXIgY3VycmVudCBDUCBzY2hlZHVsZXIg
ZmlybXdhcmUuDQoNClRoZSBib3R0b20gbGluZSBpcywgdGhlIExHUFUgbW9kZWwgcHJvcG9zZWQg
YnkgS2VubnkgaXMgcXVpdGUgYWJzdHJhY3QgDQphbmQgYWxsb3dzIGRyaXZlcnMgaW1wbGVtZW50
aW5nIGl0IGEgbG90IG9mIGZsZXhpYmlsaXR5IGRlcGVuZGluZyBvbiB0aGUgDQpjYXBhYmlsaXR5
IG9mIHRoZWlyIGhhcmR3YXJlIGFuZCBmaXJtd2FyZS4gV2UgaGF2ZW4ndCBzZXR0bGVkIG9uIGEg
ZmluYWwgDQppbXBsZW1lbnRhdGlvbiBjaG9pY2UgZXZlbiBmb3IgQU1ELg0KDQpSZWdhcmRzLA0K
IMKgIEZlbGl4DQoNCg0KPg0KPiBJIHRoaW5rIGFkZGluZyBhIGNncm91cCB3aGljaCBpcyB0aGF0
IG11Y2ggZGVwZW5kaW5nIHVwb24gdGhlIGh3DQo+IGltcGxlbWVudGF0aW9uIG9mIHRoZSBmaXJz
dCBkcml2ZXIgc3VwcG9ydGluZyBpdCBpcyBub3QgYSBnb29kIGlkZWEuDQo+IC1EYW5pZWwNCj4N
Cj4+IEkgY2FuJ3QgY29tbWVudCBvbiB0aGUgY29kZSBhcyBJJ20gdW5mYW1pbGlhciB3aXRoIHRo
ZSBkZXRhaWxzIG9mIHRoZQ0KPj4gY2dyb3VwIGNvZGUuDQo+Pg0KPj4gQWNrZWQtYnk6IEZlbGl4
IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPj4NCj4+DQo+Pj4gLS0tDQo+Pj4g
ICAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9jZ3JvdXAtdjIucnN0IHwgIDQ2ICsrKysrKysr
DQo+Pj4gICAgaW5jbHVkZS9kcm0vZHJtX2Nncm91cC5oICAgICAgICAgICAgICAgIHwgICA0ICsN
Cj4+PiAgICBpbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaCAgICAgICAgICAgICAgfCAgIDYgKysN
Cj4+PiAgICBrZXJuZWwvY2dyb3VwL2RybS5jICAgICAgICAgICAgICAgICAgICAgfCAxMzUgKysr
KysrKysrKysrKysrKysrKysrKysrDQo+Pj4gICAgNCBmaWxlcyBjaGFuZ2VkLCAxOTEgaW5zZXJ0
aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
Y2dyb3VwLXYyLnJzdCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3VwLXYyLnJzdA0K
Pj4+IGluZGV4IDg3YTE5NTEzM2VhYS4uNTdmMTg0NjliZDc2IDEwMDY0NA0KPj4+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3VwLXYyLnJzdA0KPj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUvY2dyb3VwLXYyLnJzdA0KPj4+IEBAIC0xOTU4LDYgKzE5NTgsNTIg
QEAgRFJNIEludGVyZmFjZSBGaWxlcw0KPj4+ICAgIAlTZXQgbGFyZ2VzdCBhbGxvY2F0aW9uIGZv
ciAvZGV2L2RyaS9jYXJkMSB0byA0TUINCj4+PiAgICAJZWNobyAiMjI2OjEgNG0iID4gZHJtLmJ1
ZmZlci5wZWFrLm1heA0KPj4+ICAgIA0KPj4+ICsgIGRybS5sZ3B1DQo+Pj4gKwlBIHJlYWQtd3Jp
dGUgbmVzdGVkLWtleWVkIGZpbGUgd2hpY2ggZXhpc3RzIG9uIGFsbCBjZ3JvdXBzLg0KPj4+ICsJ
RWFjaCBlbnRyeSBpcyBrZXllZCBieSB0aGUgRFJNIGRldmljZSdzIG1ham9yOm1pbm9yLg0KPj4+
ICsNCj4+PiArCWxncHUgc3RhbmRzIGZvciBsb2dpY2FsIEdQVSwgaXQgaXMgYW4gYWJzdHJhY3Rp
b24gdXNlZCB0bw0KPj4+ICsJc3ViZGl2aWRlIGEgcGh5c2ljYWwgRFJNIGRldmljZSBmb3IgdGhl
IHB1cnBvc2Ugb2YgcmVzb3VyY2UNCj4+PiArCW1hbmFnZW1lbnQuDQo+Pj4gKw0KPj4+ICsJVGhl
IGxncHUgaXMgYSBkaXNjcmV0ZSBxdWFudGl0eSB0aGF0IGlzIGRldmljZSBzcGVjaWZpYyAoaS5l
Lg0KPj4+ICsJc29tZSBEUk0gZGV2aWNlcyBtYXkgaGF2ZSA2NCBsZ3B1cyB3aGlsZSBvdGhlcnMg
bWF5IGhhdmUgMTAwDQo+Pj4gKwlsZ3B1cy4pICBUaGUgbGdwdSBpcyBhIHNpbmdsZSBxdWFudGl0
eSB3aXRoIHR3byByZXByZXNlbnRhdGlvbnMNCj4+PiArCWRlbm90ZWQgYnkgdGhlIGZvbGxvd2lu
ZyBuZXN0ZWQga2V5cy4NCj4+PiArDQo+Pj4gKwkgID09PT09ICAgICA9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09DQo+Pj4gKwkgIGNvdW50ICAgICBSZXByZXNlbnRpbmcg
bGdwdSBhcyBhbm9ueW1vdXMgcmVzb3VyY2UNCj4+PiArCSAgbGlzdCAgICAgIFJlcHJlc2VudGlu
ZyBsZ3B1IGFzIG5hbWVkIHJlc291cmNlDQo+Pj4gKwkgID09PT09ICAgICA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+Pj4gKw0KPj4+ICsJRm9yIGV4YW1wbGU6DQo+
Pj4gKwkyMjY6MCBjb3VudD0yNTYgbGlzdD0wLTI1NQ0KPj4+ICsJMjI2OjEgY291bnQ9NCBsaXN0
PTAsMiw0LDYNCj4+PiArCTIyNjoyIGNvdW50PTMyIGxpc3Q9MzItNjMNCj4+PiArDQo+Pj4gKwls
Z3B1IGlzIHJlcHJlc2VudGVkIGJ5IGEgYml0bWFwIGFuZCB1c2VzIHRoZSBiaXRtYXBfcGFyc2Vs
aXN0DQo+Pj4gKwlrZXJuZWwgZnVuY3Rpb24gc28gdGhlIGxpc3Qga2V5IGlucHV0IGZvcm1hdCBp
cyBhDQo+Pj4gKwljb21tYS1zZXBhcmF0ZWQgbGlzdCBvZiBkZWNpbWFsIG51bWJlcnMgYW5kIHJh
bmdlcy4NCj4+PiArDQo+Pj4gKwlDb25zZWN1dGl2ZWx5IHNldCBiaXRzIGFyZSBzaG93biBhcyB0
d28gaHlwaGVuLXNlcGFyYXRlZCBkZWNpbWFsDQo+Pj4gKwludW1iZXJzLCB0aGUgc21hbGxlc3Qg
YW5kIGxhcmdlc3QgYml0IG51bWJlcnMgc2V0IGluIHRoZSByYW5nZS4NCj4+PiArCU9wdGlvbmFs
bHkgZWFjaCByYW5nZSBjYW4gYmUgcG9zdGZpeGVkIHRvIGRlbm90ZSB0aGF0IG9ubHkgcGFydHMN
Cj4+PiArCW9mIGl0IHNob3VsZCBiZSBzZXQuICBUaGUgcmFuZ2Ugd2lsbCBkaXZpZGVkIHRvIGdy
b3VwcyBvZg0KPj4+ICsJc3BlY2lmaWMgc2l6ZS4NCj4+PiArCVN5bnRheDogcmFuZ2U6dXNlZF9z
aXplL2dyb3VwX3NpemUNCj4+PiArCUV4YW1wbGU6IDAtMTAyMzoyLzI1NiA9PT4gMCwxLDI1Niwy
NTcsNTEyLDUxMyw3NjgsNzY5DQo+Pj4gKw0KPj4+ICsJVGhlIGNvdW50IGtleSBpcyB0aGUgaGFt
bWluZyB3ZWlnaHQgLyBod2VpZ2h0IG9mIHRoZSBiaXRtYXAuDQo+Pj4gKw0KPj4+ICsJQm90aCBj
b3VudCBhbmQgbGlzdCBhY2NlcHQgdGhlIG1heCBhbmQgZGVmYXVsdCBrZXl3b3Jkcy4NCj4+PiAr
DQo+Pj4gKwlTb21lIERSTSBkZXZpY2VzIG1heSBvbmx5IHN1cHBvcnQgbGdwdSBhcyBhbm9ueW1v
dXMgcmVzb3VyY2VzLg0KPj4+ICsJSW4gc3VjaCBjYXNlLCB0aGUgc2lnbmlmaWNhbmNlIG9mIHRo
ZSBwb3NpdGlvbiBvZiB0aGUgc2V0IGJpdHMNCj4+PiArCWluIGxpc3Qgd2lsbCBiZSBpZ25vcmVk
Lg0KPj4+ICsNCj4+PiArCVRoaXMgbGdwdSByZXNvdXJjZSBzdXBwb3J0cyB0aGUgJ2FsbG9jYXRp
b24nIHJlc291cmNlDQo+Pj4gKwlkaXN0cmlidXRpb24gbW9kZWwuDQo+Pj4gKw0KPj4+ICAgIEdF
TSBCdWZmZXIgT3duZXJzaGlwDQo+Pj4gICAgfn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+PiAgICAN
Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nncm91cC5oIGIvaW5jbHVkZS9kcm0v
ZHJtX2Nncm91cC5oDQo+Pj4gaW5kZXggNmQ5NzA3ZTFlYjcyLi5hOGQ2YmUwYjA3NWIgMTAwNjQ0
DQo+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Nncm91cC5oDQo+Pj4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2Nncm91cC5oDQo+Pj4gQEAgLTYsNiArNiw3IEBADQo+Pj4gICAgDQo+Pj4gICAgI2lu
Y2x1ZGUgPGxpbnV4L2Nncm91cF9kcm0uaD4NCj4+PiAgICAjaW5jbHVkZSA8bGludXgvd29ya3F1
ZXVlLmg+DQo+Pj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPj4+ICAgICNpbmNsdWRlIDxk
cm0vdHRtL3R0bV9ib19hcGkuaD4NCj4+PiAgICAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmg+DQo+Pj4gICAgDQo+Pj4gQEAgLTI4LDYgKzI5LDkgQEAgc3RydWN0IGRybWNnX3Byb3Bz
IHsNCj4+PiAgICAJczY0CQkJbWVtX2hpZ2hzX2RlZmF1bHRbVFRNX1BMX1BSSVYrMV07DQo+Pj4g
ICAgDQo+Pj4gICAgCXN0cnVjdCB3b3JrX3N0cnVjdAkqbWVtX3JlY2xhaW1fd3FbVFRNX1BMX1BS
SVZdOw0KPj4+ICsNCj4+PiArCWludAkJCWxncHVfY2FwYWNpdHk7DQo+Pj4gKyAgICAgICAgREVD
TEFSRV9CSVRNQVAobGdwdV9zbG90cywgTUFYX0RSTUNHX0xHUFVfQ0FQQUNJVFkpOw0KPj4+ICAg
IH07DQo+Pj4gICAgDQo+Pj4gICAgI2lmZGVmIENPTkZJR19DR1JPVVBfRFJNDQo+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBf
ZHJtLmgNCj4+PiBpbmRleCBjNTZjZmU3NGQxYTYuLjdiMWNmYzRjZTRjMyAxMDA2NDQNCj4+PiAt
LS0gYS9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaA0KPj4+ICsrKyBiL2luY2x1ZGUvbGludXgv
Y2dyb3VwX2RybS5oDQo+Pj4gQEAgLTE0LDYgKzE0LDggQEANCj4+PiAgICAvKiBsaW1pdCBkZWZp
bmVkIHBlciB0aGUgd2F5IGRybV9taW5vcl9hbGxvYyBvcGVyYXRlcyAqLw0KPj4+ICAgICNkZWZp
bmUgTUFYX0RSTV9ERVYgKDY0ICogRFJNX01JTk9SX1JFTkRFUikNCj4+PiAgICANCj4+PiArI2Rl
ZmluZSBNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSAyNTYNCj4+PiArDQo+Pj4gICAgZW51bSBkcm1j
Z19tZW1fYndfYXR0ciB7DQo+Pj4gICAgCURSTUNHX01FTV9CV19BVFRSX0JZVEVfTU9WRUQsIC8q
IGZvciBjYWx1bGF0aW5nICdpbnN0YW50YW5lb3VzJyBidyAqLw0KPj4+ICAgIAlEUk1DR19NRU1f
QldfQVRUUl9BQ0NVTV9VUywgIC8qIGZvciBjYWx1bGF0aW5nICdpbnN0YW50YW5lb3VzJyBidyAq
Lw0KPj4+IEBAIC0zMiw2ICszNCw3IEBAIGVudW0gZHJtY2dfcmVzX3R5cGUgew0KPj4+ICAgIAlE
Uk1DR19UWVBFX01FTV9QRUFLLA0KPj4+ICAgIAlEUk1DR19UWVBFX0JBTkRXSURUSCwNCj4+PiAg
ICAJRFJNQ0dfVFlQRV9CQU5EV0lEVEhfUEVSSU9EX0JVUlNULA0KPj4+ICsJRFJNQ0dfVFlQRV9M
R1BVLA0KPj4+ICAgIAlfX0RSTUNHX1RZUEVfTEFTVCwNCj4+PiAgICB9Ow0KPj4+ICAgIA0KPj4+
IEBAIC01OCw2ICs2MSw5IEBAIHN0cnVjdCBkcm1jZ19kZXZpY2VfcmVzb3VyY2Ugew0KPj4+ICAg
IAlzNjQJCQltZW1fYndfc3RhdHNbX19EUk1DR19NRU1fQldfQVRUUl9MQVNUXTsNCj4+PiAgICAJ
czY0CQkJbWVtX2J3X2xpbWl0c19ieXRlc19pbl9wZXJpb2Q7DQo+Pj4gICAgCXM2NAkJCW1lbV9i
d19saW1pdHNfYXZnX2J5dGVzX3Blcl91czsNCj4+PiArDQo+Pj4gKwlzNjQJCQlsZ3B1X3VzZWQ7
DQo+Pj4gKwlERUNMQVJFX0JJVE1BUChsZ3B1X2FsbG9jYXRlZCwgTUFYX0RSTUNHX0xHUFVfQ0FQ
QUNJVFkpOw0KPj4+ICAgIH07DQo+Pj4gICAgDQo+Pj4gICAgLyoqDQo+Pj4gZGlmZiAtLWdpdCBh
L2tlcm5lbC9jZ3JvdXAvZHJtLmMgYi9rZXJuZWwvY2dyb3VwL2RybS5jDQo+Pj4gaW5kZXggMGVh
N2YwNjE5ZTI1Li4xOGM0MzY4ZTJjMjkgMTAwNjQ0DQo+Pj4gLS0tIGEva2VybmVsL2Nncm91cC9k
cm0uYw0KPj4+ICsrKyBiL2tlcm5lbC9jZ3JvdXAvZHJtLmMNCj4+PiBAQCAtOSw2ICs5LDcgQEAN
Cj4+PiAgICAjaW5jbHVkZSA8bGludXgvY2dyb3VwX2RybS5oPg0KPj4+ICAgICNpbmNsdWRlIDxs
aW51eC9rdGltZS5oPg0KPj4+ICAgICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4+PiArI2lu
Y2x1ZGUgPGxpbnV4L2JpdG1hcC5oPg0KPj4+ICAgICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4N
Cj4+PiAgICAjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4NCj4+PiAgICAjaW5jbHVkZSA8ZHJtL3R0
bS90dG1fYm9fYXBpLmg+DQo+Pj4gQEAgLTUyLDYgKzUzLDkgQEAgc3RhdGljIGNoYXIgY29uc3Qg
Km1lbV9id19hdHRyX25hbWVzW10gPSB7DQo+Pj4gICAgI2RlZmluZSBNRU1fQldfTElNSVRTX05B
TUVfQVZHICJhdmdfYnl0ZXNfcGVyX3VzIg0KPj4+ICAgICNkZWZpbmUgTUVNX0JXX0xJTUlUU19O
QU1FX0JVUlNUICJieXRlc19pbl9wZXJpb2QiDQo+Pj4gICAgDQo+Pj4gKyNkZWZpbmUgTEdQVV9M
SU1JVFNfTkFNRV9MSVNUICJsaXN0Ig0KPj4+ICsjZGVmaW5lIExHUFVfTElNSVRTX05BTUVfQ09V
TlQgImNvdW50Ig0KPj4+ICsNCj4+PiAgICBzdGF0aWMgc3RydWN0IGRybWNnICpyb290X2RybWNn
IF9fcmVhZF9tb3N0bHk7DQo+Pj4gICAgDQo+Pj4gICAgc3RhdGljIGludCBkcm1jZ19jc3NfZnJl
ZV9mbihpbnQgaWQsIHZvaWQgKnB0ciwgdm9pZCAqZGF0YSkNCj4+PiBAQCAtMTE1LDYgKzExOSwx
MCBAQCBzdGF0aWMgaW5saW5lIGludCBpbml0X2RybWNnX3NpbmdsZShzdHJ1Y3QgZHJtY2cgKmRy
bWNnLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4+ICAgIAlmb3IgKGkgPSAwOyBpIDw9IFRU
TV9QTF9QUklWOyBpKyspDQo+Pj4gICAgCQlkZHItPm1lbV9oaWdoc1tpXSA9IGRldi0+ZHJtY2df
cHJvcHMubWVtX2hpZ2hzX2RlZmF1bHRbaV07DQo+Pj4gICAgDQo+Pj4gKwliaXRtYXBfY29weShk
ZHItPmxncHVfYWxsb2NhdGVkLCBkZXYtPmRybWNnX3Byb3BzLmxncHVfc2xvdHMsDQo+Pj4gKwkJ
CU1BWF9EUk1DR19MR1BVX0NBUEFDSVRZKTsNCj4+PiArCWRkci0+bGdwdV91c2VkID0gYml0bWFw
X3dlaWdodChkZHItPmxncHVfYWxsb2NhdGVkLCBNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSk7DQo+
Pj4gKw0KPj4+ICAgIAltdXRleF91bmxvY2soJmRldi0+ZHJtY2dfbXV0ZXgpOw0KPj4+ICAgIAly
ZXR1cm4gMDsNCj4+PiAgICB9DQo+Pj4gQEAgLTI4MCw2ICsyODgsMTQgQEAgc3RhdGljIHZvaWQg
ZHJtY2dfcHJpbnRfbGltaXRzKHN0cnVjdCBkcm1jZ19kZXZpY2VfcmVzb3VyY2UgKmRkciwNCj4+
PiAgICAJCQkJTUVNX0JXX0xJTUlUU19OQU1FX0FWRywNCj4+PiAgICAJCQkJZGRyLT5tZW1fYndf
bGltaXRzX2F2Z19ieXRlc19wZXJfdXMpOw0KPj4+ICAgIAkJYnJlYWs7DQo+Pj4gKwljYXNlIERS
TUNHX1RZUEVfTEdQVToNCj4+PiArCQlzZXFfcHJpbnRmKHNmLCAiJXM9JWxsZCAlcz0lKnBibFxu
IiwNCj4+PiArCQkJCUxHUFVfTElNSVRTX05BTUVfQ09VTlQsDQo+Pj4gKwkJCQlkZHItPmxncHVf
dXNlZCwNCj4+PiArCQkJCUxHUFVfTElNSVRTX05BTUVfTElTVCwNCj4+PiArCQkJCWRldi0+ZHJt
Y2dfcHJvcHMubGdwdV9jYXBhY2l0eSwNCj4+PiArCQkJCWRkci0+bGdwdV9hbGxvY2F0ZWQpOw0K
Pj4+ICsJCWJyZWFrOw0KPj4+ICAgIAlkZWZhdWx0Og0KPj4+ICAgIAkJc2VxX3B1dHMoc2YsICJc
biIpOw0KPj4+ICAgIAkJYnJlYWs7DQo+Pj4gQEAgLTMxNCw2ICszMzAsMTUgQEAgc3RhdGljIHZv
aWQgZHJtY2dfcHJpbnRfZGVmYXVsdChzdHJ1Y3QgZHJtY2dfcHJvcHMgKnByb3BzLA0KPj4+ICAg
IAkJCQlNRU1fQldfTElNSVRTX05BTUVfQVZHLA0KPj4+ICAgIAkJCQlwcm9wcy0+bWVtX2J3X2F2
Z19ieXRlc19wZXJfdXNfZGVmYXVsdCk7DQo+Pj4gICAgCQlicmVhazsNCj4+PiArCWNhc2UgRFJN
Q0dfVFlQRV9MR1BVOg0KPj4+ICsJCXNlcV9wcmludGYoc2YsICIlcz0lZCAlcz0lKnBibFxuIiwN
Cj4+PiArCQkJCUxHUFVfTElNSVRTX05BTUVfQ09VTlQsDQo+Pj4gKwkJCQliaXRtYXBfd2VpZ2h0
KHByb3BzLT5sZ3B1X3Nsb3RzLA0KPj4+ICsJCQkJCXByb3BzLT5sZ3B1X2NhcGFjaXR5KSwNCj4+
PiArCQkJCUxHUFVfTElNSVRTX05BTUVfTElTVCwNCj4+PiArCQkJCXByb3BzLT5sZ3B1X2NhcGFj
aXR5LA0KPj4+ICsJCQkJcHJvcHMtPmxncHVfc2xvdHMpOw0KPj4+ICsJCWJyZWFrOw0KPj4+ICAg
IAlkZWZhdWx0Og0KPj4+ICAgIAkJc2VxX3B1dHMoc2YsICJcbiIpOw0KPj4+ICAgIAkJYnJlYWs7
DQo+Pj4gQEAgLTQwNyw5ICs0MzIsMjEgQEAgc3RhdGljIHZvaWQgZHJtY2dfdmFsdWVfYXBwbHko
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgczY0ICpkc3QsIHM2NCB2YWwpDQo+Pj4gICAgCW11dGV4
X3VubG9jaygmZGV2LT5kcm1jZ19tdXRleCk7DQo+Pj4gICAgfQ0KPj4+ICAgIA0KPj4+ICtzdGF0
aWMgdm9pZCBkcm1jZ19sZ3B1X3ZhbHVlc19hcHBseShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0K
Pj4+ICsJCXN0cnVjdCBkcm1jZ19kZXZpY2VfcmVzb3VyY2UgKmRkciwgdW5zaWduZWQgbG9uZyAq
dmFsKQ0KPj4+ICt7DQo+Pj4gKw0KPj4+ICsJbXV0ZXhfbG9jaygmZGV2LT5kcm1jZ19tdXRleCk7
DQo+Pj4gKwliaXRtYXBfY29weShkZHItPmxncHVfYWxsb2NhdGVkLCB2YWwsIE1BWF9EUk1DR19M
R1BVX0NBUEFDSVRZKTsNCj4+PiArCWRkci0+bGdwdV91c2VkID0gYml0bWFwX3dlaWdodChkZHIt
PmxncHVfYWxsb2NhdGVkLCBNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSk7DQo+Pj4gKwltdXRleF91
bmxvY2soJmRldi0+ZHJtY2dfbXV0ZXgpOw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICAgIHN0YXRpYyB2
b2lkIGRybWNnX25lc3RlZF9saW1pdF9wYXJzZShzdHJ1Y3Qga2VybmZzX29wZW5fZmlsZSAqb2Ys
DQo+Pj4gICAgCQlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBjaGFyICphdHRycykNCj4+PiAgICB7
DQo+Pj4gKwlERUNMQVJFX0JJVE1BUCh0bXBfYml0bWFwLCBNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lU
WSk7DQo+Pj4gKwlERUNMQVJFX0JJVE1BUChjaGtfYml0bWFwLCBNQVhfRFJNQ0dfTEdQVV9DQVBB
Q0lUWSk7DQo+Pj4gICAgCWVudW0gZHJtY2dfcmVzX3R5cGUgdHlwZSA9DQo+Pj4gICAgCQlEUk1D
R19DVEZfUFJJVjJSRVNUWVBFKG9mX2NmdChvZiktPnByaXZhdGUpOw0KPj4+ICAgIAlzdHJ1Y3Qg
ZHJtY2cgKmRybWNnID0gY3NzX3RvX2RybWNnKG9mX2NzcyhvZikpOw0KPj4+IEBAIC01MDEsNiAr
NTM4LDgzIEBAIHN0YXRpYyB2b2lkIGRybWNnX25lc3RlZF9saW1pdF9wYXJzZShzdHJ1Y3Qga2Vy
bmZzX29wZW5fZmlsZSAqb2YsDQo+Pj4gICAgCQkJCWNvbnRpbnVlOw0KPj4+ICAgIAkJCX0NCj4+
PiAgICAJCQlicmVhazsgLyogRFJNQ0dfVFlQRV9NRU0gKi8NCj4+PiArCQljYXNlIERSTUNHX1RZ
UEVfTEdQVToNCj4+PiArCQkJaWYgKHN0cm5jbXAoc25hbWUsIExHUFVfTElNSVRTX05BTUVfTElT
VCwgMjU2KSAmJg0KPj4+ICsJCQkJc3RybmNtcChzbmFtZSwgTEdQVV9MSU1JVFNfTkFNRV9DT1VO
VCwgMjU2KSApDQo+Pj4gKwkJCQljb250aW51ZTsNCj4+PiArDQo+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIGlmICghc3RyY21wKCJtYXgiLCBzdmFsKSB8fA0KPj4+ICsJCQkJCSFzdHJjbXAo
ImRlZmF1bHQiLCBzdmFsKSkgew0KPj4+ICsJCQkJaWYgKHBhcmVudCAhPSBOVUxMKQ0KPj4+ICsJ
CQkJCWRybWNnX2xncHVfdmFsdWVzX2FwcGx5KGRldiwgZGRyLA0KPj4+ICsJCQkJCQlwYXJlbnQt
PmRldl9yZXNvdXJjZXNbbWlub3JdLT4NCj4+PiArCQkJCQkJbGdwdV9hbGxvY2F0ZWQpOw0KPj4+
ICsJCQkJZWxzZQ0KPj4+ICsJCQkJCWRybWNnX2xncHVfdmFsdWVzX2FwcGx5KGRldiwgZGRyLA0K
Pj4+ICsJCQkJCQlwcm9wcy0+bGdwdV9zbG90cyk7DQo+Pj4gKw0KPj4+ICsJCQkJY29udGludWU7
DQo+Pj4gKwkJCX0NCj4+PiArDQo+Pj4gKwkJCWlmIChzdHJuY21wKHNuYW1lLCBMR1BVX0xJTUlU
U19OQU1FX0NPVU5ULCAyNTYpID09IDApIHsNCj4+PiArCQkJCXBfbWF4ID0gcGFyZW50ID09IE5V
TEwgPyBwcm9wcy0+bGdwdV9jYXBhY2l0eToNCj4+PiArCQkJCQliaXRtYXBfd2VpZ2h0KA0KPj4+
ICsJCQkJCXBhcmVudC0+ZGV2X3Jlc291cmNlc1ttaW5vcl0tPg0KPj4+ICsJCQkJCWxncHVfYWxs
b2NhdGVkLCBwcm9wcy0+bGdwdV9jYXBhY2l0eSk7DQo+Pj4gKw0KPj4+ICsJCQkJcmMgPSBkcm1j
Z19wcm9jZXNzX2xpbWl0X3M2NF92YWwoc3ZhbCwNCj4+PiArCQkJCQlmYWxzZSwgcF9tYXgsIHBf
bWF4LCAmdmFsKTsNCj4+PiArDQo+Pj4gKwkJCQlpZiAocmMgfHwgdmFsIDwgMCkgew0KPj4+ICsJ
CQkJCWRybWNnX3ByX2NmdF9lcnIoZHJtY2csIHJjLCBjZnRfbmFtZSwNCj4+PiArCQkJCQkJCW1p
bm9yKTsNCj4+PiArCQkJCQljb250aW51ZTsNCj4+PiArCQkJCX0NCj4+PiArDQo+Pj4gKwkJCQli
aXRtYXBfemVybyh0bXBfYml0bWFwLA0KPj4+ICsJCQkJCQlNQVhfRFJNQ0dfTEdQVV9DQVBBQ0lU
WSk7DQo+Pj4gKwkJCQliaXRtYXBfc2V0KHRtcF9iaXRtYXAsIDAsIHZhbCk7DQo+Pj4gKwkJCX0N
Cj4+PiArDQo+Pj4gKwkJCWlmIChzdHJuY21wKHNuYW1lLCBMR1BVX0xJTUlUU19OQU1FX0xJU1Qs
IDI1NikgPT0gMCkgew0KPj4+ICsJCQkJcmMgPSBiaXRtYXBfcGFyc2VsaXN0KHN2YWwsIHRtcF9i
aXRtYXAsDQo+Pj4gKwkJCQkJCU1BWF9EUk1DR19MR1BVX0NBUEFDSVRZKTsNCj4+PiArDQo+Pj4g
KwkJCQlpZiAocmMpIHsNCj4+PiArCQkJCQlkcm1jZ19wcl9jZnRfZXJyKGRybWNnLCByYywgY2Z0
X25hbWUsDQo+Pj4gKwkJCQkJCQltaW5vcik7DQo+Pj4gKwkJCQkJY29udGludWU7DQo+Pj4gKwkJ
CQl9DQo+Pj4gKw0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAJYml0bWFwX2FuZG5vdChj
aGtfYml0bWFwLCB0bXBfYml0bWFwLA0KPj4+ICsJCQkJCXByb3BzLT5sZ3B1X3Nsb3RzLA0KPj4+
ICsJCQkJCU1BWF9EUk1DR19MR1BVX0NBUEFDSVRZKTsNCj4+PiArDQo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIAlpZiAoIWJpdG1hcF9lbXB0eShjaGtfYml0bWFwLA0KPj4+ICsJCQkJCQlN
QVhfRFJNQ0dfTEdQVV9DQVBBQ0lUWSkpIHsNCj4+PiArCQkJCQlkcm1jZ19wcl9jZnRfZXJyKGRy
bWNnLCAwLCBjZnRfbmFtZSwNCj4+PiArCQkJCQkJCW1pbm9yKTsNCj4+PiArCQkJCQljb250aW51
ZTsNCj4+PiArCQkJCX0NCj4+PiArCQkJfQ0KPj4+ICsNCj4+PiArDQo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChwYXJlbnQgIT0gTlVMTCkgew0KPj4+ICsJCQkJYml0bWFwX2FuZChj
aGtfYml0bWFwLCB0bXBfYml0bWFwLA0KPj4+ICsJCQkJcGFyZW50LT5kZXZfcmVzb3VyY2VzW21p
bm9yXS0+bGdwdV9hbGxvY2F0ZWQsDQo+Pj4gKwkJCQlwcm9wcy0+bGdwdV9jYXBhY2l0eSk7DQo+
Pj4gKw0KPj4+ICsJCQkJaWYgKGJpdG1hcF9lbXB0eShjaGtfYml0bWFwLA0KPj4+ICsJCQkJCQlw
cm9wcy0+bGdwdV9jYXBhY2l0eSkpIHsNCj4+PiArCQkJCQlkcm1jZ19wcl9jZnRfZXJyKGRybWNn
LCAwLA0KPj4+ICsJCQkJCQkJY2Z0X25hbWUsIG1pbm9yKTsNCj4+PiArCQkJCQljb250aW51ZTsN
Cj4+PiArCQkJCX0NCj4+PiArCQkJfQ0KPj4+ICsNCj4+PiArCQkJZHJtY2dfbGdwdV92YWx1ZXNf
YXBwbHkoZGV2LCBkZHIsIHRtcF9iaXRtYXApOw0KPj4+ICsNCj4+PiArCQkJYnJlYWs7IC8qIERS
TUNHX1RZUEVfTEdQVSAqLw0KPj4+ICAgIAkJZGVmYXVsdDoNCj4+PiAgICAJCQlicmVhazsNCj4+
PiAgICAJCX0gLyogc3dpdGNoICh0eXBlKSAqLw0KPj4+IEBAIC02MDYsNiArNzIwLDcgQEAgc3Rh
dGljIHNzaXplX3QgZHJtY2dfbGltaXRfd3JpdGUoc3RydWN0IGtlcm5mc19vcGVuX2ZpbGUgKm9m
LCBjaGFyICpidWYsDQo+Pj4gICAgCQkJYnJlYWs7DQo+Pj4gICAgCQljYXNlIERSTUNHX1RZUEVf
QkFORFdJRFRIOg0KPj4+ICAgIAkJY2FzZSBEUk1DR19UWVBFX01FTToNCj4+PiArCQljYXNlIERS
TUNHX1RZUEVfTEdQVToNCj4+PiAgICAJCQlkcm1jZ19uZXN0ZWRfbGltaXRfcGFyc2Uob2YsIGRt
LT5kZXYsIHNhdHRyKTsNCj4+PiAgICAJCQlicmVhazsNCj4+PiAgICAJCWRlZmF1bHQ6DQo+Pj4g
QEAgLTczMSw2ICs4NDYsMjAgQEAgc3RydWN0IGNmdHlwZSBmaWxlc1tdID0gew0KPj4+ICAgIAkJ
LnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR19UWVBFX0JBTkRXSURUSCwNCj4+PiAgICAJ
CQkJCQlEUk1DR19GVFlQRV9ERUZBVUxUKSwNCj4+PiAgICAJfSwNCj4+PiArCXsNCj4+PiArCQku
bmFtZSA9ICJsZ3B1IiwNCj4+PiArCQkuc2VxX3Nob3cgPSBkcm1jZ19zZXFfc2hvdywNCj4+PiAr
CQkud3JpdGUgPSBkcm1jZ19saW1pdF93cml0ZSwNCj4+PiArCQkucHJpdmF0ZSA9IERSTUNHX0NU
Rl9QUklWKERSTUNHX1RZUEVfTEdQVSwNCj4+PiArCQkJCQkJRFJNQ0dfRlRZUEVfTElNSVQpLA0K
Pj4+ICsJfSwNCj4+PiArCXsNCj4+PiArCQkubmFtZSA9ICJsZ3B1LmRlZmF1bHQiLA0KPj4+ICsJ
CS5zZXFfc2hvdyA9IGRybWNnX3NlcV9zaG93LA0KPj4+ICsJCS5mbGFncyA9IENGVFlQRV9PTkxZ
X09OX1JPT1QsDQo+Pj4gKwkJLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR19UWVBFX0xH
UFUsDQo+Pj4gKwkJCQkJCURSTUNHX0ZUWVBFX0RFRkFVTFQpLA0KPj4+ICsJfSwNCj4+PiAgICAJ
eyB9CS8qIHRlcm1pbmF0ZSAqLw0KPj4+ICAgIH07DQo+Pj4gICAgDQo+Pj4gQEAgLTc0NCw2ICs4
NzMsMTAgQEAgc3RydWN0IGNncm91cF9zdWJzeXMgZHJtX2NncnBfc3Vic3lzID0gew0KPj4+ICAg
IA0KPj4+ICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBkcm1jZ191cGRhdGVfY2dfdHJlZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQ0KPj4+ICAgIHsNCj4+PiArICAgICAgICBiaXRtYXBfemVybyhkZXYt
PmRybWNnX3Byb3BzLmxncHVfc2xvdHMsIE1BWF9EUk1DR19MR1BVX0NBUEFDSVRZKTsNCj4+PiAr
ICAgICAgICBiaXRtYXBfZmlsbChkZXYtPmRybWNnX3Byb3BzLmxncHVfc2xvdHMsDQo+Pj4gKwkJ
CWRldi0+ZHJtY2dfcHJvcHMubGdwdV9jYXBhY2l0eSk7DQo+Pj4gKw0KPj4+ICAgIAkvKiBpbml0
IGNncm91cHMgY3JlYXRlZCBiZWZvcmUgcmVnaXN0cmF0aW9uIChpLmUuIHJvb3QgY2dyb3VwKSAq
Lw0KPj4+ICAgIAlpZiAocm9vdF9kcm1jZyAhPSBOVUxMKSB7DQo+Pj4gICAgCQlzdHJ1Y3QgY2dy
b3VwX3N1YnN5c19zdGF0ZSAqcG9zOw0KPj4+IEBAIC04MDAsNiArOTMzLDggQEAgdm9pZCBkcm1j
Z19kZXZpY2VfZWFybHlfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4+ICAgIAlmb3Ig
KGkgPSAwOyBpIDw9IFRUTV9QTF9QUklWOyBpKyspDQo+Pj4gICAgCQlkZXYtPmRybWNnX3Byb3Bz
Lm1lbV9oaWdoc19kZWZhdWx0W2ldID0gUzY0X01BWDsNCj4+PiAgICANCj4+PiArCWRldi0+ZHJt
Y2dfcHJvcHMubGdwdV9jYXBhY2l0eSA9IE1BWF9EUk1DR19MR1BVX0NBUEFDSVRZOw0KPj4+ICsN
Cj4+PiAgICAJZHJtY2dfdXBkYXRlX2NnX3RyZWUoZGV2KTsNCj4+PiAgICB9DQo+Pj4gICAgRVhQ
T1JUX1NZTUJPTChkcm1jZ19kZXZpY2VfZWFybHlfaW5pdCk7DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
