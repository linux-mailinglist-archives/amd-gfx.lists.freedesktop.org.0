Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59893BFACD
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 23:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79766EE04;
	Thu, 26 Sep 2019 21:02:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800057.outbound.protection.outlook.com [40.107.80.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E3F6EE06
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 21:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5RlN8vTVFVHJyWixjI9eLAArrx5dKRqKZiHXm8rwAPZkAF9ccFl0RVLl7ityHVgm+uH1E6XHZ4JSaaHWbLXimrF+vpBexFa4N8kQBeUKQT6tcgN1rA3FB7YXJQpuOpkVs1+THuKdS3Anob12rsnM0rf/Do1AXi6dBb7D2IX/6MhLFKx0NZG/Gd7AWOpl6JPcszuBFDg2Y5UzHqLOYXGKREPbyxbtO8IAv1Mc5XIaAijWrwSEv9EwIBV5r+anGzgGMyo9E0X0zTRrBeEZ41HsHqGhTgLnaZAD6pywrZZ10Neo0+HDXEgoroETqatZ6Sr3aZC6Qy60us9m5FRg1axNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5aNamp+KgReKuLm/9J8WqKCT5qP0uqEd/2Bim3oKPw=;
 b=nDTEDY2dcOf7McELpAirzW8CKBlDh8xUBxArNLB5KYpzjkwDVAeMON6Ra7KTa0XPA67t60n8t6BDvpueE2apu+jLR2P6Q8K+/Varpt1HWHt3SA2Fv+C5eDvO9QRV6H0gTJTfMBCkr6u5WkMMesFAP2wWy65hZMkOj5ndEn2f9BjDupXL63kNnzzEhQF+q8GOEJpr1Z6BA2oLQl7+ZmadvHNu/2YJHKP+45s/1MAwpT9b/PHbeahrWugk44spzawo5GiugxrtjPw/Xs5n+b7uJp5tUAYI6WrofTbdZ4efEGCgrGjY4arCBKkzztRiLjQrAJF8CkyKLpi7wOQW7UOZ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB3484.namprd12.prod.outlook.com (20.178.199.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 26 Sep 2019 21:02:18 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 21:02:18 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info
Thread-Topic: [PATCH 2/2] drm/amdkfd: Query vmid pasid mapping through stored
 info
Thread-Index: AQHVdKMLyJt1GYcC8kyOrdIhlWAcVqc+YuUAgAAPLwA=
Date: Thu, 26 Sep 2019 21:02:17 +0000
Message-ID: <a1e7533b-90eb-9c0c-3fa2-e214ad2ad4aa@amd.com>
References: <20190926194548.15119-1-Yong.Zhao@amd.com>
 <20190926194548.15119-2-Yong.Zhao@amd.com>
 <ae7610f9-97bb-45f4-56ed-7a3dcbc4758c@amd.com>
In-Reply-To: <ae7610f9-97bb-45f4-56ed-7a3dcbc4758c@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTOPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::45) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 730256c6-a16a-4a5c-d92a-08d742c4d0ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3484; 
x-ms-traffictypediagnostic: DM6PR12MB3484:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB348467BC9A32F4C9E1C75586F4860@DM6PR12MB3484.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(189003)(199004)(66066001)(5660300002)(65956001)(66476007)(66556008)(64756008)(66446008)(66946007)(2906002)(6916009)(86362001)(58126008)(8676002)(81166006)(305945005)(81156014)(8936002)(7736002)(316002)(25786009)(31686004)(14454004)(6436002)(229853002)(6486002)(256004)(2501003)(71190400001)(71200400001)(478600001)(5640700003)(966005)(6512007)(6306002)(52116002)(99286004)(6506007)(386003)(53546011)(186003)(76176011)(3846002)(6116002)(6246003)(26005)(2616005)(476003)(446003)(102836004)(11346002)(36756003)(65806001)(31696002)(486006)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3484;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ysE9I138Kg23YhJC2tFfh7xkZJJgCRhWexVYdsS5eenDDKrcfOP6HS2dv1UIDlLZKc8sPIVpUQbtNSji3x0hd7b6ZAS4bM5GdNkZNBR233V/r/I7A+4euaT2lz+uuFVDuujqchqY/W7jWJVNmEmjqpAnE2M1XUqS1fZlSRRQ+lUjCSA8H+fm70IVqNHnehOT/mYkG7BRKQ0GQooRE4PEp962WtFYCa8g5SZDnTCQ9ldedY4faEmAIAw51oJS00AJq6YyhN0ib9m7ZA/utGxGu1057KO0nPxzyWlc4bTbkFrKb1riQXdFWXSE2GI6IdaPKwX0tHgthfkrONzbDWXLANfW1ldsCox5qLZMJ3uY7Xm8uctCziPzqdfW0ereIK9IRILGVift/e4L73271l0riWuh7U2BNCG1UnaYXVBu8K7nr+jT8BGy6FnPuAljmCarB8SCtO8Ng5KbQLmwlDnr1A==
x-ms-exchange-transport-forked: True
Content-ID: <152478E4DDD15048AE769B05B6AAA48C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730256c6-a16a-4a5c-d92a-08d742c4d0ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 21:02:17.9406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GSEiTFeCFSSX/IaMLIkK2whA+6XaiGnXPHXmPmdF4jKUFMKWps6AEe64VP4hfqRZw3hVBjpgNE3xHgq0R276FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3484
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5aNamp+KgReKuLm/9J8WqKCT5qP0uqEd/2Bim3oKPw=;
 b=WuvgGNTw6/L7LVz9nMplJSQklSLS6QCIREiXyuOjeVwRkXJjCHcr4aiUlRlr/f3FEQA2Jya/SSOzhkDjXmZQdt6Eg+lins2Q6M+vxygCFah9iYfNuOHQooZzrxlh/xeIDU/A5wkQhsFn0NMwfXMv+5p1viE4+jVj1x4kKDQIcXc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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

SSB0aGluayB0aGlzIGlzIG9ubHkgZm9yIG5vbmUtaHdzIGNhc2UgLsKgIEhXUyBtYXnCoCBkeW5h
bWljIGNoYW5nZSB0aGUgDQptYXBwaW5nIGFuZCBkcml2ZXIgd2lsbCBub3QgZ2V0IHVwZGF0ZWQg
LsKgIElmIHRoYXQncyB0aGUgY2FzZSAsIHBsZWFzZSANCnNwZWNpZnkgdGhpcyBpcyBmb3Igbm9u
ZSBoYXJkd2FyZSBzY2hlZHVsZXIgY2FzZSBpbiB0aGUgaGVhZGVyIC4NCg0KUmVnYXJkcw0KDQpz
aGFveXVuLmxpdQ0KDQpPbiAyMDE5LTA5LTI2IDQ6MDcgcC5tLiwgS3VlaGxpbmcsIEZlbGl4IHdy
b3RlOg0KPiBPbiAyMDE5LTA5LTI2IDM6NDYgcC5tLiwgWmhhbywgWW9uZyB3cm90ZToNCj4+IEJl
Y2F1c2Ugd2UgcmVjb3JkIHRoZSBtYXBwaW5nIGluIHRoZSBzb2Z0d2FyZSwgd2UgY2FuIHF1ZXJ5
IHBhc2lkDQo+PiB0aHJvdWdoIHZtaWQgdXNpbmcgdGhlIHN0b3JlZCBtYXBwaW5nIGluc3RlYWQg
b2YgcmVhZGluZyBmcm9tIEFUQw0KPj4gcmVnaXN0ZXJzLg0KPj4NCj4+IFRoaXMgYWxzbyBwcmVw
YXJlcyBmb3IgdGhlIGRlZmVhdHVyZWQgQVRDIGJsb2NrIGluIGZ1dHVyZSBBU0lDcy4NCj4+DQo+
PiBDaGFuZ2UtSWQ6IEk3ODFjYjlkMzBkYzBjYzkzMzc5OTA4ZmYxY2Y4ZGE3OThiYjI2ZjEzDQo+
PiBTaWduZWQtb2ZmLWJ5OiBZb25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPg0KPj4gLS0tDQo+
PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW50X3Byb2Nlc3NfdjkuYyB8IDUg
KysrLS0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9p
bnRfcHJvY2Vzc192OS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ludF9wcm9j
ZXNzX3Y5LmMNCj4+IGluZGV4IGFiOGE2OTVjNGEzYy4uNzU0YzA1MmI3ZDcyIDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2ludF9wcm9jZXNzX3Y5LmMNCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pbnRfcHJvY2Vzc192OS5jDQo+
PiBAQCAtNTgsOCArNTgsOSBAQCBzdGF0aWMgYm9vbCBldmVudF9pbnRlcnJ1cHRfaXNyX3Y5KHN0
cnVjdCBrZmRfZGV2ICpkZXYsDQo+PiAgICAJCW1lbWNweShwYXRjaGVkX2locmUsIGloX3Jpbmdf
ZW50cnksDQo+PiAgICAJCQkJZGV2LT5kZXZpY2VfaW5mby0+aWhfcmluZ19lbnRyeV9zaXplKTsN
Cj4+ICAgIA0KPj4gLQkJcGFzaWQgPSBkZXYtPmtmZDJrZ2QtPmdldF9hdGNfdm1pZF9wYXNpZF9t
YXBwaW5nX3Bhc2lkKA0KPj4gLQkJCQlkZXYtPmtnZCwgdm1pZCk7DQo+PiArCQlwYXNpZCA9IGRl
di0+ZHFtLT52bWlkX3Bhc2lkW3ZtaWRdOw0KPj4gKwkJaWYgKCFwYXNpZCkNCj4+ICsJCQlwcl9l
cnIoInBhc2lkIGlzIG5vdCBxdWVyaWVkIGNvcnJlY3RseVxuIik7DQo+IFRoaXMgZXJyb3IgbWVz
c2FnZSBpcyBub3QgaGVscGZ1bC4gQSBoZWxwZnVsIG1lc3NhZ2UgbWF5IGJlIHNvbWV0aGluZw0K
PiBsaWtlICJObyBQQVNJRCBhc3NpZ25lZCBmb3IgVk1JRCAlZCIuIFRoYXQgc2FpZCwgcHJpbnRp
bmcgZXJyb3IgbWVzc2FnZXMNCj4gaW4gYW4gaW50ZXJydXB0IGhhbmRsZXIgdGhhdCBjYW4gYmUg
cG90ZW50aWFsbHkgdmVyeSBmcmVxdWVudCBpcyBub3QgdGhlDQo+IGJlc3QgaWRlYS4gVGhlcmUg
aXMgYWxyZWFkeSBhIFdBUk5fT05DRSBhIGZldyBsaW5lcyBiZWxvdyB0aGF0IHNob3VsZCBiZQ0K
PiB0cmlnZ2VyZWQgaWYgUEFTSUQgaXMgbm90IGFzc2lnbmVkLg0KPg0KPiBSZWdhcmRzLA0KPiAg
IMKgIEZlbGl4DQo+DQo+DQo+PiAgICANCj4+ICAgIAkJLyogUGF0Y2ggdGhlIHBhc2lkIGZpZWxk
ICovDQo+PiAgICAJCXBhdGNoZWRfaWhyZVszXSA9IGNwdV90b19sZTMyKChsZTMyX3RvX2NwdShw
YXRjaGVkX2locmVbM10pDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
