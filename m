Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B33A6C1E8
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 22:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D35289F71;
	Wed, 17 Jul 2019 20:09:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740077.outbound.protection.outlook.com [40.107.74.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102FA89F71
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 20:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2Qb+yVmsg0vsZ+LA5PZ7+GuJsk5oynkoYWjY7X97hyyfhDBLaJjkjPZe+KXm48PnjBFThjnm/DJfxB8V/DWKVNecSPkY+8PctqQx78xFFz3n5eNCbtIFqLHre0JkLcbPAeFAiP4PpFQftoANelNDe6DObyBn0hs3Q7jWkDbB85FFdVG+MHZ0J8r57qivdYXv3ZFcSku/F8OAvN8ERXbHTkqqN2aPcaP2GgMxJxoyo5orAZ2BSwZd+VDv8h8mJCTbg6qfenoq0NIQ1G8Sx5d+DSa4i/WielrPTgAyqkFm7/Wy/+iGSYjI0ObHVt1vnXHSC2xq6caxkacxJIixS5Yzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv29/tTGCxNN99Gsbo64ACV1LAfHsdoA+HGUWYlWFZs=;
 b=KbGfjXMyKiKBVBi2q4jHSjM0sWQ8AE3d79VnZsvRUXbx6XLZe2MiDQCc2UhmzoTASF2Bj8D/rzqXkfKUmiOWmrnf7wxqy9mWhmcBI4DR4iogE/Iy5QYq+SWY5yod1YZ+Js3PAvSSgr8MRXWevyHLNU/bDe3+Xk2z+RoOqjwqlROj7r9lHyqiqGrUbGd8D4Js5eowtnHLCosAzqfsPd3FUKHNf7bKG5nG+u8ZEtoQGBQdj7a/3R/cPXkKLG/0RgJqcdTAFqJiuy72xuwZFcJY5Uv2XPKH1XtixSUY7kXyH+ulJdCH+bhWZt8iwKEzTN+HOJqtIlOG3GLlKqGv+SpfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3676.namprd12.prod.outlook.com (10.255.76.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 20:09:42 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 20:09:42 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Greathouse, Joseph" <Joseph.Greathouse@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Topic: [PATCH v2] drm/amdgpu: Default disable GDS for compute VMIDs
Thread-Index: AQHVPMy77SY6Do7Rv0ad09XurGn4R6bPPYcA
Date: Wed, 17 Jul 2019 20:09:42 +0000
Message-ID: <268d3673-da7f-8e75-6131-3de9291d77d4@amd.com>
References: <28783441-080b-1696-b4ea-f6ec24901fb1@amd.com>
 <20190717182233.93031-1-Joseph.Greathouse@amd.com>
In-Reply-To: <20190717182233.93031-1-Joseph.Greathouse@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::19) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efc61ab9-6f2a-46dd-cf38-08d70af2b4a7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3676; 
x-ms-traffictypediagnostic: DM6PR12MB3676:
x-microsoft-antispam-prvs: <DM6PR12MB367666D3A1C81954C4FDAFDB92C90@DM6PR12MB3676.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(199004)(189003)(26005)(31696002)(68736007)(476003)(52116002)(186003)(102836004)(31686004)(8936002)(65956001)(65806001)(6246003)(8676002)(66066001)(81166006)(81156014)(5660300002)(71200400001)(446003)(58126008)(71190400001)(86362001)(6506007)(64126003)(2501003)(99286004)(110136005)(53546011)(76176011)(6512007)(14444005)(11346002)(386003)(66476007)(66556008)(316002)(14454004)(305945005)(6486002)(7736002)(256004)(486006)(6436002)(64756008)(66446008)(65826007)(2906002)(53936002)(6116002)(3846002)(66946007)(36756003)(478600001)(25786009)(2616005)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3676;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iPKgOznwAMuTq1HaevxXcri8QFNJNmYaT/LpecaElnVrfVFYb+1T7voegGTmJrUmI7qwkhFZF3vBov/IwX53xppO5unlzthGaaYMl4zpsMPa6/M4//0As97ViOvDdgrmuiEAf2vH0IE2/qMxlpOWbSMnhffvTxMQ0pinvVF+8euOgBZVQ5vNtN0eVh603r9cmKAxCHVF7GEHqTsElYLnAc4+fQ135ZQjpVrPxcAuck3DJtFhwLPRlnB85zmaprxz6GOiaRQZP9swj3iodGruLW41cq/e8krXiX5BogP0JnNiltDHkmClEV7LwBJmh3AV0inOlso+HU53MOKK7EEswWPlohPSp3xF50zlnXkC9dGkmOVAPTT/BpTVyUH6hU0cmqrw4E+wKk7iE/Rj/oH3evknIOlZVF8dPppmMNjJwhU=
Content-ID: <B3F8F9F87CAB5146929E43AA1FD9F614@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc61ab9-6f2a-46dd-cf38-08d70af2b4a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 20:09:42.8442 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3676
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv29/tTGCxNN99Gsbo64ACV1LAfHsdoA+HGUWYlWFZs=;
 b=JpsI0lgRPzYp8XvviHWNebeHSqN1k3oMKgygHmKGZrb6qQNhiEZZus949nU4BL8j8HBAmw3NVqV5ypAMdA151gL4zfWsgGcG2Hd1wJzhcp7yn0qSB/vl9olf+71sbgzfriL6An8o+W5V2JpILpNfqiW5MBB7O3o0Hlo82yOocdI=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xNyAxNDoyMywgR3JlYXRob3VzZSwgSm9zZXBoIHdyb3RlOg0KPiBUaGUgR0RT
IGFuZCBHV1MgYmxvY2tzIGRlZmF1bHQgdG8gYWxsb3dpbmcgYWxsIFZNSURzIHRvDQo+IGFjY2Vz
cyBhbGwgZW50cmllcy4gR3JhcGhpY3MgVk1JRHMgY2FuIGhhbmRsZSBzZXR0aW5nDQo+IHRoZXNl
IGxpbWl0cyB3aGVuIHRoZSBkcml2ZXIgbGF1bmNoZXMgd29yay4gSG93ZXZlciwNCj4gY29tcHV0
ZSB3b3JrbG9hZHMgdW5kZXIgSFdTIGNvbnRyb2wgZG9uJ3QgZ28gdGhyb3VnaCB0aGUNCj4ga2Vy
bmVsIGRyaXZlci4gSW5zdGVhZCwgSFdTIGZpcm13YXJlIHNob3VsZCBzZXQgdGhlc2UNCj4gbGlt
aXRzIHdoZW4gYSBwcm9jZXNzIGlzIHB1dCBpbnRvIGEgVk1JRCBzbG90Lg0KPg0KPiBEaXNhYmxl
IGFjY2VzcyB0byB0aGVzZSBkZXZpY2VzIGJ5IGRlZmF1bHQgYnkgdHVybmluZyBvZmYNCj4gYWxs
IG1hc2sgYml0cyAoZm9yIE9BKSBhbmQgc2V0dGluZyBCQVNFPVNJWkU9MCAoZm9yIEdEUw0KPiBh
bmQgR1dTKSBmb3IgYWxsIGNvbXB1dGUgVk1JRHMuIElmIGEgcHJvY2VzcyB3YW50cyB0byB1c2UN
Cj4gdGhlc2UgcmVzb3VyY2VzLCB0aGV5IGNhbiByZXF1ZXN0IHRoaXMgZnJvbSB0aGUgSFdTDQo+
IGZpcm13YXJlICh3aGVuIHN1Y2ggY2FwYWJpbGl0aWVzIGFyZSBlbmFibGVkKS4gSFdTIHdpbGwN
Cj4gdGhlbiBoYW5kbGUgc2V0dGluZyB0aGUgYmFzZSBhbmQgbGltaXQgZm9yIHRoZSBwcm9jZXNz
IHdoZW4NCj4gaXQgaXMgYXNzaWduZWQgdG8gYSBWTUlELg0KPg0KPiBUaGlzIHdpbGwgYWxzbyBw
cmV2ZW50IHVzZXIga2VybmVscyBmcm9tIGdldHRpbmcgJ3N0dWNrJyBpbg0KPiBHV1MgYnkgYWNj
aWRlbnQgaWYgdGhleSB3cml0ZSBHV1MtdXNpbmcgY29kZSBidXQgSFdTDQo+IGZpcm13YXJlIGlz
IG5vdCBzZXQgdXAgdG8gaGFuZGxlIEdXUyByZXNldC4gVW50aWwgSFdTIGlzDQo+IGVuYWJsZWQg
dG8gaGFuZGxlIEdXUyBwcm9wZXJseSwgYWxsIEdXUyBhY2Nlc3NlcyB3aWxsDQo+IE1FTV9WSU9M
IGZhdWx0IHRoZSBrZXJuZWwuDQo+DQo+IHYyOiBNb3ZlIGluaXRpYWxpemF0aW9uIG91dHNpZGUg
b2YgU1JCTSBtdXRleA0KPg0KPiBDaGFuZ2UtSWQ6IEk4ZWRjZWE5ZDBiMTRkMTZhNzQ0NGJjZjlm
YmY5NDUxYWVmOGI3MDdkDQo+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBHcmVhdGhvdXNlIDxKb3Nl
cGguR3JlYXRob3VzZUBhbWQuY29tPg0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYyB8IDkgKysrKysrKysrDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y3XzAuYyAgfCA5ICsrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OF8wLmMgIHwgOSArKysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjlfMC5jICB8IDkgKysrKysrKysrDQo+ICAgNCBmaWxlcyBjaGFuZ2Vk
LCAzNiBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBf
MC5jDQo+IGluZGV4IDYxODI5MWRmNjU5Yi4uNzNkY2I2MzJhM2NlIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KPiBAQCAtMTUxNiw2ICsxNTE2LDE1IEBAIHN0
YXRpYyB2b2lkIGdmeF92MTBfMF9pbml0X2NvbXB1dGVfdm1pZChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikNCj4gICAJfQ0KPiAgIAludl9ncmJtX3NlbGVjdChhZGV2LCAwLCAwLCAwLCAwKTsN
Cj4gICAJbXV0ZXhfdW5sb2NrKCZhZGV2LT5zcmJtX211dGV4KTsNCj4gKw0KPiArCS8qIEluaXRp
YWxpemUgYWxsIGNvbXB1dGUgVk1JRHMgdG8gaGF2ZSBubyBHRFMsIEdXUywgb3IgT0ENCj4gKwkg
ICBhY2NjZXNzLiBUaGVzZSBzaG91bGQgYmUgZW5hYmxlZCBieSBGVyBmb3IgdGFyZ2V0IFZNSURz
LiAqLw0KPiArCWZvciAoaSA9IEZJUlNUX0NPTVBVVEVfVk1JRDsgaSA8IExBU1RfQ09NUFVURV9W
TUlEOyBpKyspIHsNCj4gKwkJV1JFRzMyX1NPQzE1X09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBf
QkFTRSwgMiAqIGksIDApOw0KPiArCQlXUkVHMzJfU09DMTVfT0ZGU0VUKEdDLCAwLCBtbUdEU19W
TUlEMF9TSVpFLCAyICogaSwgMCk7DQo+ICsJCVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1t
R0RTX0dXU19WTUlEMCwgaSwgMCk7DQo+ICsJCVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1t
R0RTX09BX1ZNSUQwLCBpLCAwKTsNCj4gKwl9DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lk
IGdmeF92MTBfMF90Y3BfaGFydmVzdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjdfMC5jDQo+IGluZGV4IGUxZTJhNDRlZTEzYy4uM2Y5
ODYyNDc3MmE0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djdfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmMNCj4g
QEAgLTE4NzcsNiArMTg3NywxNSBAQCBzdGF0aWMgdm9pZCBnZnhfdjdfMF9pbml0X2NvbXB1dGVf
dm1pZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCj4gICAJfQ0KPiAgIAljaWtfc3JibV9z
ZWxlY3QoYWRldiwgMCwgMCwgMCwgMCk7DQo+ICAgCW11dGV4X3VubG9jaygmYWRldi0+c3JibV9t
dXRleCk7DQo+ICsNCj4gKwkvKiBJbml0aWFsaXplIGFsbCBjb21wdXRlIFZNSURzIHRvIGhhdmUg
bm8gR0RTLCBHV1MsIG9yIE9BDQo+ICsJICAgYWNjY2Vzcy4gVGhlc2Ugc2hvdWxkIGJlIGVuYWJs
ZWQgYnkgRlcgZm9yIHRhcmdldCBWTUlEcy4gKi8NCj4gKwlmb3IgKGkgPSBGSVJTVF9DT01QVVRF
X1ZNSUQ7IGkgPCBMQVNUX0NPTVBVVEVfVk1JRDsgaSsrKSB7DQo+ICsJCVdSRUczMihhbWRncHVf
Z2RzX3JlZ19vZmZzZXRbaV0ubWVtX2Jhc2UsIDApOw0KPiArCQlXUkVHMzIoYW1kZ3B1X2dkc19y
ZWdfb2Zmc2V0W2ldLm1lbV9zaXplLCAwKTsNCj4gKwkJV1JFRzMyKGFtZGdwdV9nZHNfcmVnX29m
ZnNldFtpXS5nd3MsIDApOw0KPiArCQlXUkVHMzIoYW1kZ3B1X2dkc19yZWdfb2Zmc2V0W2ldLm9h
LCAwKTsNCj4gKwl9DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGdmeF92N18wX2NvbmZp
Z19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OF8wLmMNCj4gaW5kZXggOGM1OTBhNTU0Njc1Li5lNDAyOGQ1NGY4ZjcgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYw0KPiBAQCAtMzcwMiw2ICszNzAy
LDE1IEBAIHN0YXRpYyB2b2lkIGdmeF92OF8wX2luaXRfY29tcHV0ZV92bWlkKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQ0KPiAgIAl9DQo+ICAgCXZpX3NyYm1fc2VsZWN0KGFkZXYsIDAsIDAs
IDAsIDApOw0KPiAgIAltdXRleF91bmxvY2soJmFkZXYtPnNyYm1fbXV0ZXgpOw0KPiArDQo+ICsJ
LyogSW5pdGlhbGl6ZSBhbGwgY29tcHV0ZSBWTUlEcyB0byBoYXZlIG5vIEdEUywgR1dTLCBvciBP
QQ0KPiArCSAgIGFjY2Nlc3MuIFRoZXNlIHNob3VsZCBiZSBlbmFibGVkIGJ5IEZXIGZvciB0YXJn
ZXQgVk1JRHMuICovDQo+ICsJZm9yIChpID0gRklSU1RfQ09NUFVURV9WTUlEOyBpIDwgTEFTVF9D
T01QVVRFX1ZNSUQ7IGkrKykgew0KPiArCQlXUkVHMzIoYW1kZ3B1X2dkc19yZWdfb2Zmc2V0W2ld
Lm1lbV9iYXNlLCAwKTsNCj4gKwkJV1JFRzMyKGFtZGdwdV9nZHNfcmVnX29mZnNldFtpXS5tZW1f
c2l6ZSwgMCk7DQo+ICsJCVdSRUczMihhbWRncHVfZ2RzX3JlZ19vZmZzZXRbaV0uZ3dzLCAwKTsN
Cj4gKwkJV1JFRzMyKGFtZGdwdV9nZHNfcmVnX29mZnNldFtpXS5vYSwgMCk7DQo+ICsJfQ0KPiAg
IH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCBnZnhfdjhfMF9jb25maWdfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+
IGluZGV4IDVhZjYwZTFjNzM1YS4uMjU5YTM1Mzk1ZmVjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92OV8wLmMNCj4gQEAgLTIwMjUsNiArMjAyNSwxNSBAQCBzdGF0aWMgdm9p
ZCBnZnhfdjlfMF9pbml0X2NvbXB1dGVfdm1pZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikN
Cj4gICAJfQ0KPiAgIAlzb2MxNV9ncmJtX3NlbGVjdChhZGV2LCAwLCAwLCAwLCAwKTsNCj4gICAJ
bXV0ZXhfdW5sb2NrKCZhZGV2LT5zcmJtX211dGV4KTsNCj4gKw0KPiArCS8qIEluaXRpYWxpemUg
YWxsIGNvbXB1dGUgVk1JRHMgdG8gaGF2ZSBubyBHRFMsIEdXUywgb3IgT0ENCj4gKwkgICBhY2Nj
ZXNzLiBUaGVzZSBzaG91bGQgYmUgZW5hYmxlZCBieSBGVyBmb3IgdGFyZ2V0IFZNSURzLiAqLw0K
PiArCWZvciAoaSA9IEZJUlNUX0NPTVBVVEVfVk1JRDsgaSA8IExBU1RfQ09NUFVURV9WTUlEOyBp
KyspIHsNCj4gKwkJV1JFRzMyX1NPQzE1X09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBfQkFTRSwg
MiAqIGksIDApOw0KPiArCQlXUkVHMzJfU09DMTVfT0ZGU0VUKEdDLCAwLCBtbUdEU19WTUlEMF9T
SVpFLCAyICogaSwgMCk7DQo+ICsJCVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1tR0RTX0dX
U19WTUlEMCwgaSwgMCk7DQo+ICsJCVdSRUczMl9TT0MxNV9PRkZTRVQoR0MsIDAsIG1tR0RTX09B
X1ZNSUQwLCBpLCAwKTsNCj4gKwl9DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGdmeF92
OV8wX2NvbnN0YW50c19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
