Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDB3865A0
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 17:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3506E86E;
	Thu,  8 Aug 2019 15:23:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760088.outbound.protection.outlook.com [40.107.76.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AC36E86E
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 15:23:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEz9AjgxDWLgXF80MZ1feEsnw0XbAU4MT0yUNFxoDpBwljDa5/aEqDldgnMlfu7DnkP4TM4xF891xFWG53rwh78yuMH7CdlWTR32NFqgUtQPpKzFzheHVxu23P6Lhnv0GPx/2IU4VYrb/B0nDuZkpzOMF/ukpigT4WV9TQxH2IVFP6Gr3kwDxkRmBM9e6ApDqhvq3N42fCzp34obVvVnHEL0xz+7MGpoKWeVvHniFjKQG7kT4VQDja0Hdcpiv3wMOl4vKlYQHtTcujACTuIVJQzA1E1ngGYPT3gCktrazQMh1+e8KLXqSNEruEDsnu+dIFjwKSe7qYzcH57zV/zHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UR3mU1XvV3nutUL8yQeCqMQi82QBybEeXHSnt1Xj74k=;
 b=feEGqYJPlQDyoQy+A76b92nHnVj2RfC3bQzAavvB5ytgvj5GPtpo9/P6hExRa4JKeWV73tnw9OcKMaxMEOBJRp//3YKAvAczsM24GaLcsHaiH6ukZN4Bd7dibloqeuaTZgWyttT+xLwIT/ZAZ1jDlE0OX9gpn3L9ubJfEuINmzaCG5cpqTo9pLxHOK3zq/DGEoGQ7/nT4rwEK5zZIx81ddFVPeYETtPG8Yo5rTI6jsG3aOC6IohkVmpoSzfm94sjO/82PLajQ9X40mgqtLZPGtyR704iOYb6sJ8m01EgSPNYBZo0659tLLxpUWn1jxiUwkoa2qq3p7l3MBw+Lc/xgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2582.namprd12.prod.outlook.com (52.132.141.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Thu, 8 Aug 2019 15:23:53 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 15:23:53 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Russell, Kent"
 <Kent.Russell@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>
Subject: Re: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Topic: [PATCH] drm/amdgpu: update ras sysfs feature info
Thread-Index: AQHVS2Rt1iYG/yilwEGD8WZ3EfxSkabsNOFAgAUEOoCAAA1/4IAADKqAgAABaxCAAAtcgIAAANiAgAAC34A=
Date: Thu, 8 Aug 2019 15:23:53 +0000
Message-ID: <0f16d668-4960-e74a-2e09-6b8dba7dd996@amd.com>
References: <20190805080408.20770-1-tao.zhou1@amd.com>
 <DM5PR12MB14183A68E61B70184BEC459FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <BN6PR12MB16188930BC2E19E50B0EDB9185D70@BN6PR12MB1618.namprd12.prod.outlook.com>
 <DM5PR12MB141855615C68E69C503AC4B7FCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
 <eeb641a8-2336-e177-cb8b-bcf6c21acdef@gmail.com>
 <DM5PR12MB141892A269179BD41156EFBEFCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
 <d09024c8-c723-1524-b43f-625a7807ae9b@amd.com>
 <DM5PR12MB14184B52E2B7DDFD866EFAFAFCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB14184B52E2B7DDFD866EFAFAFCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0222.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::18) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f3d22f8-07f7-448d-25d4-08d71c146bbb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2582; 
x-ms-traffictypediagnostic: DM5PR12MB2582:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB2582DAADCD8F6FB902AAFA2883D70@DM5PR12MB2582.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(189003)(199004)(13464003)(76176011)(15650500001)(5660300002)(64126003)(110136005)(66574012)(386003)(966005)(6116002)(102836004)(316002)(14454004)(58126008)(99286004)(478600001)(71200400001)(6506007)(2616005)(6436002)(256004)(71190400001)(53546011)(6486002)(486006)(14444005)(46003)(86362001)(11346002)(186003)(446003)(476003)(31696002)(52116002)(36756003)(65826007)(81156014)(66556008)(81166006)(66446008)(7736002)(66946007)(8936002)(6306002)(64756008)(31686004)(6636002)(2906002)(65956001)(305945005)(6512007)(53936002)(66476007)(65806001)(229853002)(2501003)(6246003)(8676002)(25786009)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2582;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JTPYU8w5XAtWiw8qaMKpZ77PgnA+CysAF3Jffxgd4p6mayCcuIjge4QYW2Tw15XIooOtYzYp3u83mHh7dXhtDIB5r81kfbY9KsLA3YJAbzBUJsdDlzMMdRfwYJnyL9SL1nDd2OoNn3MDZl8n/kCTjU/LVV+Udp82xPKg46xv5kYL9DYQu3O8mx/Qe2IHBdNRXdnJrQ9mPXuF1NDXM1VWppMXB78lL9RWbR8hrcWhLdq3iSKPru/0Jj/58iOvAA4wBM0TfK+R90MoVNgX5+MHRsfOISwP/EfWcUu6xfDV/KqwpRH1RFJnwXY1Al0e9KVIMro6XReFpqMdhwNHSm5NdwGsCqUnXT7a0FTIY077BocIiqhFhxXWImpMB6OUtY8dwY4MQdBfp8WMJokAh3O9idJfY0rS4+RcMC4oYRc4fLM=
Content-ID: <A3CC7855A631EB43BF254A1D34C06A97@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3d22f8-07f7-448d-25d4-08d71c146bbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 15:23:53.2063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMh1BwSJ5NesCJjIsGuDwju9cGRwI9vPyS+GBbNHNvWPrSYlhykK7tkOwopSjHmA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2582
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UR3mU1XvV3nutUL8yQeCqMQi82QBybEeXHSnt1Xj74k=;
 b=0BQviSCv1ixfAN3mFjvGM78GnaCrXH7pmR6yWzwgDE12141+7+h0Hx6YM8Mmg/uRD7vC9f+AF7dSGIn37bNloA7s5TnRtnXcB7bvyfXsLN4JR+IuOWqsLfV04CPscEHRXprFfFkqkiiX6aPlneAB/IPmKQ9NcfP59QYMY0GSoY4=
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

SGkgSGF3a2luZywNCg0KeWVhaCwgYnV0IHRoaXMgaXNuJ3Qgc3VmZmljaWVudCB0byBjb21wbHkg
dG8gdGhlIHVwc3RyZWFtIHJ1bGVzLg0KDQpTZWUgd2hhdCB3ZSBuZWVkIHRvIGRvIGlzIHRvIHJl
bW92ZSB0aGUgZXh0cmEgdGV4dCBhbmQgdGhlIHBlciBJUCANCmluZm9ybWF0aW9uLiBJbiBvdGhl
ciB3b3JkcyBzb21ldGhpbmcgbGlrZSB0aGlzOg0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIA0KYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzLmMNCmluZGV4IDFhNDQxMmU0NzgxMC4uYzhjN2Y5NjU1ZmZjIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCkBAIC04MTksMjIgKzgxOSw3IEBA
IHN0YXRpYyBzc2l6ZV90IA0KYW1kZ3B1X3Jhc19zeXNmc19mZWF0dXJlc19yZWFkKHN0cnVjdCBk
ZXZpY2UgKmRldiwNCiDCoMKgwqDCoMKgwqDCoCBzc2l6ZV90IHM7DQogwqDCoMKgwqDCoMKgwqAg
c3RydWN0IHJhc19tYW5hZ2VyICpvYmo7DQoNCi3CoMKgwqDCoMKgwqAgcyA9IHNjbnByaW50Zihi
dWYsIFBBR0VfU0laRSwgImZlYXR1cmUgbWFzazogMHgleFxuIiwgDQpjb24tPmZlYXR1cmVzKTsN
Ci0NCi3CoMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IHJhc19ibG9ja19jb3VudDsgaSsrKSB7
DQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZWFkLmJsb2NrID0gaTsNCi0NCi3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChhbWRncHVfcmFzX2lzX2ZlYXR1cmVfZW5hYmxl
ZChhZGV2LCAmaGVhZCkpIHsNCi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBvYmogPSBhbWRncHVfcmFzX2ZpbmRfb2JqKGFkZXYsICZoZWFkKTsNCi3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzICs9IHNjbnByaW50ZigmYnVm
W3NdLCBQQUdFX1NJWkUgLSBzLA0KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiVzOiAlc1xuIiwNCi3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJhc19ibG9ja19zdHIoaSksDQotIHJhc19lcnJfc3RyKG9iai0+
aGVhZC50eXBlKSk7DQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UNCi3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzICs9IHNjbnByaW50Zigm
YnVmW3NdLCBQQUdFX1NJWkUgLSBzLA0KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiVzOiBkaXNhYmxl
ZFxuIiwNCi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhc19ibG9ja19zdHIoaSkpOw0KLcKgwqDCoMKg
wqDCoCB9DQorwqDCoMKgwqDCoMKgIHMgPSBzY25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIweCV4
XG4iLCBjb24tPmZlYXR1cmVzKTsNCg0KIMKgwqDCoMKgwqDCoMKgIHJldHVybiBzOw0KIMKgfQ0K
DQpBbmQgSSdtIG5vdCB0YWxraW5nIGFib3V0IHNvbWUgcnVsZSB3ZSBjb3VsZCBiZW5kLiBUaGlz
IGlzIGFuIGFic29sdXRlbHkgDQoqTVVTVCogaGF2ZSBmb3IgdXBzdHJlYW1pbmcuDQoNClJlZ2Fy
ZHMsDQpDaHJpc3RpYW4uDQoNCkFtIDA4LjA4LjE5IHVtIDE3OjE3IHNjaHJpZWIgWmhhbmcsIEhh
d2tpbmc6DQo+IEhpIENocmlzLA0KPg0KPiBJIHRob3VnaHQgSSd2ZSBzdGF0ZWQgYXMgIlRoZSBm
ZWF0dXJlIG1hc2sgaXMgYWxyZWFkeSBnb29kIGVub3VnaCBmb3IgdGhpcyBub2RlIi4gSXQgaXMg
anVzdCBhIHVpbnQzMiB2YWx1ZS4gV2UgZG9uJ3QgZXhwZWN0IFJPQ20gU01JIHRvIHJlYWQgYW55
IG90aGVyIGluZm9ybWF0aW9uIGZyb20gZmVhdHVyZSBub2RlIGV4Y2VwdCBmb3IgdGhlIGZlYXR1
cmUgbWFzay4NCj4NCj4gUmVnYXJkcywNCj4gSGF3a2luZw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0Bh
bWQuY29tPg0KPiBTZW50OiAyMDE55bm0OOaciDjml6UgMjM6MTENCj4gVG86IFpoYW5nLCBIYXdr
aW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBSdXNzZWxsLCBLZW50IDxLZW50LlJ1c3NlbGxA
YW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBGcmVlaGls
bCwgQ2hyaXMgPENocmlzLkZyZWVoaWxsQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGRybS9hbWRncHU6IHVwZGF0ZSByYXMgc3lzZnMgZmVhdHVyZSBpbmZvDQo+DQo+IEhpIEhhd2tp
bmcsDQo+DQo+IGEgbXVsdGkgbGluZSB2YWx1ZSBpcyBub3QgdGhlIHByb2JsZW0sIGJ1dCBoZXJl
IHlvdSBoYXZlIG11bHRpcGxlIHZhbHVlcy4NCj4NCj4gRS5nLiBpbiB0aGUgY2FzZSBvZiB0aGUg
cHAgdGFibGVzIHRoYXQgaXMgb25lIGJpZyBhcnJheSBvZiBwb3dlciBwcm9maWxlcyBhbmQgd2Ug
YWN0dWFsbHkgaGFkIGEgZGlzY3Vzc2lvbiBpZiBleHBvc2luZyB0aGVtIGxpa2UgdGhpcyBpcyBv
ayBvciBub3QuDQo+DQo+IEJ1dCBpbiB0aGUgY2FzZSBvZiB0aGUgcmFzIGZlYXR1cmVzIHlvdSBn
b3QgbXVsdGlwbGUgZGlmZmVyZW50IHRoaW5ncyBpbiB0aGUgc2FtZSBmaWxlLiBBbmQgdGhhdCBp
biB0dXJuIGlzIGEgY2xlYXIgdmlvbGF0aW9uIG9mIHRoZSBzeXNmcyBydWxlcy4NCj4NCj4gSSBk
b24ndCB0aGluayB3ZSBjYW4ndCB1cHN0cmVhbSB0aGUgaW50ZXJmYWNlIGxpa2UgdGhpcy4gU2Vl
IGhlcmUgZm9yIGEgZ29vZCBzdW1tYXJ5IG9mIHRoZSBydWxlcyBhcyB3ZWxsOiBodHRwczovL2x3
bi5uZXQvQXJ0aWNsZXMvMzc4ODg0Lw0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+DQo+
IEFtIDA4LjA4LjE5IHVtIDE3OjAwIHNjaHJpZWIgWmhhbmcsIEhhd2tpbmc6DQo+PiBIaSBDaHJp
cywNCj4+DQo+PiBJJ20gbm90IGF3YXJlIG9mIGhvdyBST0NNIFNNSSB1c2luZyBmZWF0dXJlIG5v
ZGVzLiBidXQgbm90IGFsbCB0aGUgc3lzZnMgYXJlIGludGVuZGVkIHRvIGJlIHVzZWQgYnkgdXBw
ZXIgbGV2ZWwgYXBwcy9saWJzLg0KPj4NCj4+IFRoZXJlIGFyZSBidW5jaGVzIG9mIHN5c2ZzIGVu
dHJpZXMgdGhhdCBoYXZlIG11bHRpcGxlIGxpbmUgdmFsdWUuIFRoZSBtb3N0IGNvbXBsaWNhdGUg
b25lIHdvdWxkIGJlIHBwX3Bvd2VyX3Byb2ZpbGVfbW9kZSwgd2hpY2ggbG9va3MgbGlrZS4NCj4+
DQo+PiAwIEJPT1RVUF9ERUZBVUxUKjoNCj4+ICAgICAgICAgICAgICAgICAgICAgICAwKCAgICAg
ICBHRlhDTEspICAgICAgIDAgICAgICAgMCAgICAgICAxICAgICAgIDAgICAgICAgNCAgICAgODAw
IDQ1ODc1MjAgIC02NTUzNiAgICAgICAwDQo+PiAgICAgICAgICAgICAgICAgICAgICAgMSggICAg
ICAgU09DQ0xLKSAgICAgICAwICAgICAgIDAgICAgICAgMSAgICAgICAwICAgICAgIDQgICAgIDgw
MCAgMzI3NjgwICAgLTY1NTMgICAgICAgMA0KPj4gICAgICAgICAgICAgICAgICAgICAgIDIoICAg
ICAgICAgVUNMSykgICAgICAgMCAgICAgICAwICAgICAgIDEgICAgICAgMCAgICAgICA0ICAgICA4
MDAgIDMyNzY4MCAgLTY1NTM2ICAgICAgIDANCj4+IC4uLi4uLi4NCj4+IDEgM0RfRlVMTF9TQ1JF
RU4gOg0KPj4gICAgICAgICAgICAgICAgICAgICAgIDAoICAgICAgIEdGWENMSykgICAgICAgMCAg
ICAgICAxICAgICAgIDEgICAgICAgMCAgICAgICA0ICAgICA4MDAgNDU4NzUyMCAgLTY1NTM2ICAg
ICAgIDANCj4+ICAgICAgICAgICAgICAgICAgICAgICAxKCAgICAgICBTT0NDTEspICAgICAgIDAg
ICAgICAgMSAgICAgICA0ICAgICA4NTAgICAgICAgNCAgICAgODAwICAzMjc2ODAgIC02NTUzNiAg
ICAgICAwDQo+Pg0KPj4gUmVnYXJkcywNCj4+IEhhd2tpbmcNCj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+PiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVy
a2VuQGdtYWlsLmNvbT4NCj4+IFNlbnQ6IDIwMTnlubQ45pyIOOaXpSAyMjoyNQ0KPj4gVG86IFpo
YW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBSdXNzZWxsLCBLZW50DQo+PiA8
S2VudC5SdXNzZWxsQGFtZC5jb20+OyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47DQo+
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5A
YW1kLmNvbT47DQo+PiBGcmVlaGlsbCwgQ2hyaXMgPENocmlzLkZyZWVoaWxsQGFtZC5jb20+DQo+
PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiB1cGRhdGUgcmFzIHN5c2ZzIGZlYXR1
cmUgaW5mbw0KPj4NCj4+IEhpIEhhd2tpbmcsDQo+Pg0KPj4gbG9va3MgbGlrZSB5b3Ugc2tpcHBl
ZCBteSByZXNwb25zZS4NCj4+DQo+PiBFdmVuIHRoZSBjdXJyZW50IHdheSBob3cgc3lzZnMgaXMg
dXNlZCBpbiB0aGUgcmFzIGNvZGUgaXMgYSBjbGVhciBOTy1HTyBhbmQgc2hvdWxkIGJlIGZpeGVk
IGJlZm9yZSB0aGlzIGlzIHB1c2hlZCB1cHN0cmVhbS4NCj4+DQo+PiBBIHN5c2ZzIGVudHJ5IHNo
b3VsZCBzZXJpb3VzbHkgTk9UIHJldHVybiBhIG11bHRpIGxpbmUgdmFsdWUgd2hpY2ggbmVlZHMg
dG8gYmUgZXh0ZW5zaXZlbHkgcGFyc2VkIGJ5IHRoZSBhcHBsaWNhdGlvbi4NCj4+DQo+PiBSZWdh
cmRzLA0KPj4gQ2hyaXN0aWFuLg0KPj4NCj4+IEFtIDA4LjA4LjE5IHVtIDE1OjUwIHNjaHJpZWIg
WmhhbmcsIEhhd2tpbmc6DQo+Pj4gVW5kZXJzdG9vZCBhbmQgYWdyZWUgd2Ugc2hvdWxkIGtlZXAg
c3RhYmxlIGludGVyZmFjZXMuDQo+Pj4NCj4+PiBCdXQgdGhlIGluZm9ybWF0aW9uIGluIGZlYXR1
cmUgbm9kZSBpcyBub3QgY29ycmVjdCBhbmQgbWFrZXMgcGVvcGxlIGNvbmZ1c2luZy4gQmFzaWNh
bGx5LCBlYWNoIElQIGJsb2NrcyBjYW4gc3VwcG9ydCBhbGwgdGhlIGZvdXIgZXJyb3IgdHlwZXMs
IG5vdCBqdXN0IG11bHRpLXVuY29ycmVjdGFibGUuIEFzIGEgcmVzdWx0LCBhbnkgdXBwZXIgbGV2
ZWwgYXBwcy9saWJzIHRoYXQgcmVhZCBmcm9tIHRoaXMgZmlsZSB3aWxsIGp1c3QgZ2V0IGNvbmZ1
c2luZyBpbmZvcm1hdGlvbiBhcyB3ZWxsLiBUaGUgZmVhdHVyZSBtYXNrIGlzIGFscmVhZHkgZ29v
ZCBlbm91Z2ggZm9yIHRoaXMgbm9kZS4NCj4+Pg0KPj4+IFJlZ2FyZHMsDQo+Pj4gSGF3a2luZw0K
Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4gRnJvbTogUnVzc2VsbCwgS2VudCA8
S2VudC5SdXNzZWxsQGFtZC5jb20+DQo+Pj4gU2VudDogMjAxOeW5tDjmnIg45pelIDIwOjUxDQo+
Pj4gVG86IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBaaG91MSwgVGFv
DQo+Pj4gPFRhby5aaG91MUBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IFBhbiwgWGluaHVpDQo+Pj4gPFhpbmh1aS5QYW5AYW1kLmNvbT47IEZyZWVoaWxsLCBDaHJpcyA8
Q2hyaXMuRnJlZWhpbGxAYW1kLmNvbT4NCj4+PiBDYzogWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFt
ZC5jb20+DQo+Pj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdwdTogdXBkYXRlIHJhcyBz
eXNmcyBmZWF0dXJlIGluZm8NCj4+Pg0KPj4+ICtDaHJpcyBGcmVlaGlsbA0KPj4+DQo+Pj4gV2hp
bGUgSSBjYW4gdW5kZXJzdGFuZCB0aGlzIGNoYW5nZSwgdGhpcyBicm9rZSBvdXIgU01JIGludGVy
ZmFjZSwgd2hpY2ggd2FzIGV4cGVjdGluZyBhIHNwZWNpZmljIHN0cmluZyBmb3JtYXQgZm9yIHRo
ZSByYXMvZmVhdHVyZXMgZmlsZS4gVGhpcyBoYXMgaGFwcGVuZWQgYSBmZXcgdGltZXMgbm93LCB3
aGVyZSBjaGFuZ2VzIHRvIHRoZSBSQVMgc3lzZnMgZmlsZXMgaGFzIGJyb2tlIHRoZSBTTUkgQ0xJ
IGFuZC9vciBTTUkgTElCLiBDYW4gd2UgcGxlYXNlIGdldCBhIHN0YWJsZSBpbnRlcmZhY2UgYW5k
IHN5c2ZzIGZvcm1hdCBzZXQgdXAgYmVmb3JlIHB1Ymxpc2hpbmcgcGF0Y2hlcz8gVGhpcyBpcyBj
cmVhdGluZyBhIGxvdCBvZiBleHRyYSB3b3JrIGZvciBkZXZlbG9wZXJzIHdpdGggdGhlIFNNSSB0
byBjb25zdGFudGx5IGtlZXAgdXAgd2l0aCB0aGUgY2hhbmdlcyBiZWluZyBtYWRlIHRvIHN5c2Zz
IGZpbGVzLiBUaGFuayB5b3UuDQo+Pj4NCj4+PiAgICAgS2VudA0KPj4+DQo+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4+PiBaaGFuZywgSGF3a2luZw0KPj4+
IFNlbnQ6IE1vbmRheSwgQXVndXN0IDUsIDIwMTkgNDoxNSBBTQ0KPj4+IFRvOiBaaG91MSwgVGFv
IDxUYW8uWmhvdTFAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPj4+
IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+DQo+Pj4gQ2M6IFpob3UxLCBUYW8gPFRh
by5aaG91MUBhbWQuY29tPg0KPj4+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6IHVw
ZGF0ZSByYXMgc3lzZnMgZmVhdHVyZSBpbmZvDQo+Pj4NCj4+PiBSZXZpZXdlZC1ieTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KPj4+DQo+Pj4gUmVnYXJkcywNCj4+PiBI
YXdraW5nDQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4+
PiBUYW8gWmhvdQ0KPj4+IFNlbnQ6IDIwMTnlubQ45pyINeaXpSAxNjowNA0KPj4+IFRvOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNv
bT47DQo+Pj4gWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCj4+PiBDYzog
WmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQo+Pj4gU3ViamVjdDogW1BBVENIXSBkcm0v
YW1kZ3B1OiB1cGRhdGUgcmFzIHN5c2ZzIGZlYXR1cmUgaW5mbw0KPj4+DQo+Pj4gcmVtb3ZlIGNv
bmZ1c2VkIHJhcyBlcnJvciB0eXBlIGluZm8NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRhbyBa
aG91IDx0YW8uemhvdTFAYW1kLmNvbT4NCj4+PiAtLS0NCj4+PiAgICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTcgKysrKystLS0tLS0tLS0tLS0NCj4+PiAgICAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+Pj4NCj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jDQo+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4+PiBpbmRleCBk
MmU4YTg1ZjZlMzguLjM2OTY1MTI0N2IyMyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmFzLmMNCj4+PiBAQCAtNzg3LDI1ICs3ODcsMTggQEAgc3RhdGljIHNz
aXplX3QgYW1kZ3B1X3Jhc19zeXNmc19mZWF0dXJlc19yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwN
Cj4+PiAgICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7
DQo+Pj4gICAgIAlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiBoZWFkOw0KPj4+ICAgICAJaW50IHJhc19i
bG9ja19jb3VudCA9IEFNREdQVV9SQVNfQkxPQ0tfQ09VTlQ7DQo+Pj4gLQlpbnQgaTsNCj4+PiAr
CWludCBpLCBlbmFibGVkOw0KPj4+ICAgICAJc3NpemVfdCBzOw0KPj4+IC0Jc3RydWN0IHJhc19t
YW5hZ2VyICpvYmo7DQo+Pj4gICAgIA0KPj4+ICAgICAJcyA9IHNjbnByaW50ZihidWYsIFBBR0Vf
U0laRSwgImZlYXR1cmUgbWFzazogMHgleFxuIiwNCj4+PiBjb24tPmZlYXR1cmVzKTsNCj4+PiAg
ICAgDQo+Pj4gICAgIAlmb3IgKGkgPSAwOyBpIDwgcmFzX2Jsb2NrX2NvdW50OyBpKyspIHsNCj4+
PiAgICAgCQloZWFkLmJsb2NrID0gaTsNCj4+PiArCQllbmFibGVkID0gYW1kZ3B1X3Jhc19pc19m
ZWF0dXJlX2VuYWJsZWQoYWRldiwgJmhlYWQpOw0KPj4+ICAgICANCj4+PiAtCQlpZiAoYW1kZ3B1
X3Jhc19pc19mZWF0dXJlX2VuYWJsZWQoYWRldiwgJmhlYWQpKSB7DQo+Pj4gLQkJCW9iaiA9IGFt
ZGdwdV9yYXNfZmluZF9vYmooYWRldiwgJmhlYWQpOw0KPj4+IC0JCQlzICs9IHNjbnByaW50Zigm
YnVmW3NdLCBQQUdFX1NJWkUgLSBzLA0KPj4+IC0JCQkJCSIlczogJXNcbiIsDQo+Pj4gLQkJCQkJ
cmFzX2Jsb2NrX3N0cihpKSwNCj4+PiAtCQkJCQlyYXNfZXJyX3N0cihvYmotPmhlYWQudHlwZSkp
Ow0KPj4+IC0JCX0gZWxzZQ0KPj4+IC0JCQlzICs9IHNjbnByaW50ZigmYnVmW3NdLCBQQUdFX1NJ
WkUgLSBzLA0KPj4+IC0JCQkJCSIlczogZGlzYWJsZWRcbiIsDQo+Pj4gLQkJCQkJcmFzX2Jsb2Nr
X3N0cihpKSk7DQo+Pj4gKwkJcyArPSBzY25wcmludGYoJmJ1ZltzXSwgUEFHRV9TSVpFIC0gcywN
Cj4+PiArCQkJCSIlcyByYXMgZmVhdHVyZSBtYXNrOiAlc1xuIiwNCj4+PiArCQkJCXJhc19ibG9j
a19zdHIoaSksIGVuYWJsZWQ/Im9uIjoib2ZmIik7DQo+Pj4gICAgIAl9DQo+Pj4gICAgIA0KPj4+
ICAgICAJcmV0dXJuIHM7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
