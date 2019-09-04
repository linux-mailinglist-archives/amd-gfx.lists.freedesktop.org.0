Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F3A96C9
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 00:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6676689CBA;
	Wed,  4 Sep 2019 22:59:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AE3891F2
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 22:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMQVGD1+z9noA22sMP9fEbw1Tb9ZtOmW+SiopdHAZq97v463GRymGYTlMnJfnYGB8ZxZJ2AIynVAA7FwS0+iEgfqzMTOTXuFpVLPR42G5MlWdpEtLJHZQHgyMw3EFAdOGMxduZJR8QsFqUfsPdTn+/Me8YGxPxozhgC5qNOFbf8k8AZwCTqLqWc9bZUCBak8BpZGLTqDKHFKE3KE832MK4O0H6zmgtq1P0qMHwKWXh2H1ALTz6pAmPJVIcxMEphsdvuYpx6gg0iLfqXtAsR/9qE6Sr3JFwek4coq7Y9ej4suyORhXZbTzHjl/S4cOn8YFwl6yy++1Kf7ZHOHCxQ7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnf3/A/yXRFcIVz9X6NOwyDwZMwqo6XZ8No3noMQgCY=;
 b=LVPuHLFJEob2G3mNUz3VNN2oJ1uOKz6SjQdSDlrY5PBhti2iL231c2SA0jiIZjwGf4uzpozAIGUdWbik8DOoaSsUlXgp2oCmtIJM+fHusbYZoc38iFqMSZizOLUpdw5M7a85ZBZ29W49AcgNDo08B4pEJGnBZEpiWI439XFx0eR+RTwaNlYJEOdVeZ/yB0MHu1P4kYddyb/6n/44xmjyCkm0bZ0D5g/ilAP4riunlj31EeJ6bIejsKGO0BSWi8D3uuJZtu/OSEDVP3IXmZ0G0blb53MXM2gYZTE7fl4xwX8XfwiaAI+f30zeEEtnGejEYwwrxnOXRV5/RyispwaLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3407.namprd12.prod.outlook.com (20.178.241.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 22:59:36 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 22:59:36 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 02/10] drm/amdkfd: add renoir kfd device info
Thread-Topic: [PATCH 02/10] drm/amdkfd: add renoir kfd device info
Thread-Index: AQHVYzgw4ROcrLJLOUmkYVYz93hV26cb6jmAgAC+JQA=
Date: Wed, 4 Sep 2019 22:59:36 +0000
Message-ID: <MN2PR12MB33099A5302E0C44675ADE492ECB80@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190904154803.5102-1-ray.huang@amd.com>
 <20190904154803.5102-3-ray.huang@amd.com>
 <d0c57dac-d5c6-de6c-be9f-d70cbe0f3d96@amd.com>
In-Reply-To: <d0c57dac-d5c6-de6c-be9f-d70cbe0f3d96@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MN2PR12MB3309.namprd12.prod.outlook.com
 (15.20.2220.007)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2b3ff65-530a-4b6d-bcb9-08d7318b8f06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3407; 
x-ms-traffictypediagnostic: MN2PR12MB3407:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34077977AD78D6B367D3BB64ECB80@MN2PR12MB3407.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(199004)(189003)(71200400001)(71190400001)(316002)(6246003)(99286004)(7696005)(54906003)(25786009)(4326008)(256004)(53546011)(6862004)(26005)(76176011)(6506007)(66066001)(102836004)(186003)(53936002)(11346002)(33656002)(486006)(476003)(446003)(55016002)(6436002)(7736002)(66476007)(9686003)(66556008)(64756008)(66446008)(74316002)(14454004)(52536014)(66946007)(3846002)(6116002)(76116006)(478600001)(81166006)(81156014)(8936002)(6636002)(2906002)(86362001)(229853002)(8676002)(305945005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3407;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6rsCwbp+WPQj0pv5lF94HLwBC4K54s4u0LiPGB0fB+E/XvuU421XEk5AtrUEq9UvVepDQyCdvbMrFcgeXewAU+ovrhafeTWymvMDvtpHpt2mgTPW2t+wfMGYNw/Dquj6nC4HYO4UdEzJ2S2ZKoVbfHwQWZhKF8yxknVknR6EVdjGZrmpNYrC34YCi7o1U1iujpcTAsKtWux/pQY06+nf8UrkFVjFC2RTwpScLtupyj4Og2hpFEzIUo+sw2fnCD/jnZM97Ucp4OAM5/bfg6JP+Ldc17KhBm5AIDQEQ+cRd+H8325zcvH3eDAE45u5pbcphgevzzyFnB8wwSb5PTqipK9OaOwbVH75cHOJOsS0Pk78PIrVINtTkbIFwRsIgJxwlZL+VCDDPvzPrdsjDmZJfVbroLItroJja4KMhMi/Q90=
Content-ID: <39E1FF33491A4E478E9E771E822F8392@amdcloud.onmicrosoft.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b3ff65-530a-4b6d-bcb9-08d7318b8f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 22:59:36.3654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MG9HC4UFk9fUBKlhh5i5Ahxn7xtXFaaI+QJYwlwf7Lb2PEFitqbRXAbYbd2aFUjRd29/zpuHV1bMxAW1akIjKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3407
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnf3/A/yXRFcIVz9X6NOwyDwZMwqo6XZ8No3noMQgCY=;
 b=ibHhs51M/xzyvqppc0wY/z4W8GyWJaLwsG42sDv6aVLc11L6iikzQCevFOF6s9OxTTs2z8ciGWEwQF9UrS206JxrzmF3Z3rVw+OlvFAyNAjrFkVD3RXTbeZ3i0zFmJrbSU/hp6nRATOghV0z50hOfJbwb0Yz7uy4Kn9Lkn9rUYg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhao, Yong" <Yong.Zhao@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDM6Mzg6MzFBTSArMDgwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IE9uIDIwMTktMDktMDQgMTE6NDggYS5tLiwgSHVhbmcsIFJheSB3cm90ZToKPiA+
IFRoaXMgcGF0Y2ggaW5pdHMgcmVub2lyIGtmZCBkZXZpY2UgaW5mbywgc28gd2UgdHJlYXQgcmVu
b2lyIGFzICJkZ3B1Igo+ID4gKGJ5cGFzcyBpb21tdSB2MikuIFdpbGwgZW5hYmxlIG5lZWRzX2lv
bW11X2RldmljZSB0aWxsIHJlbm9pciBpb21tdSBpcyByZWFkeS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+IAo+IExvb2tzIGdvb2QsIGJ1dCBw
bGVhc2UgY29vcmRpbmF0ZSB3aXRoIFlvbmcgd2hvIGlzIGNoYW5naW5nIHRoZSAKPiBzdHJ1Y3R1
cmUgb2YgdGhlIGtmZCBkZXZpY2UgaW5mbyB0YWJsZS4gU2VlIGhpcyBwYXRjaCAiZHJtL2FtZGtm
ZDogUXVlcnkgCj4ga2ZkIGRldmljZSBpbmZvIGJ5IENISVAgaWQgaW5zdGVhZCBvZiBwY2kgZGV2
aWNlIGlkIiBmb3IgZGV0YWlscy4gCj4gV2hvZXZlciBnb2VzIGluIHNlY29uZCB3aWxsIG5lZWQg
dG8gcmViYXNlIGFuZCBmaXggdGhlIGNvbmZsaWN0LgoKVGFsa2VkIHdpdGggWW9uZywgaGUgaGFz
IHN1Ym1pdHRlZCB0aGUgcGF0Y2ggdG8gZHJtLW5leHQuCkkgd2lsbCByZWJhc2UgdGhlIHBhdGNo
LgoKVGhhbmtzLApSYXkKCj4gCj4gUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5L
dWVobGluZ0BhbWQuY29tPgo+IAo+IAo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZS5jCj4gPiBpbmRleCAyNTE0MjYzLi4xZjY1NTg1IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKPiA+IEBAIC0zMTcsNiArMzE3LDIz
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIHZlZ2EyMF9kZXZpY2VfaW5m
byA9IHsKPiA+ICAgCS5udW1fc2RtYV9xdWV1ZXNfcGVyX2VuZ2luZSA9IDgsCj4gPiAgIH07Cj4g
PiAgIAo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIHJlbm9pcl9kZXZp
Y2VfaW5mbyA9IHsKPiA+ICsJLmFzaWNfZmFtaWx5ID0gQ0hJUF9SRU5PSVIsCj4gPiArCS5tYXhf
cGFzaWRfYml0cyA9IDE2LAo+ID4gKwkubWF4X25vX29mX2hxZCAgPSAyNCwKPiA+ICsJLmRvb3Ji
ZWxsX3NpemUgID0gOCwKPiA+ICsJLmloX3JpbmdfZW50cnlfc2l6ZSA9IDggKiBzaXplb2YodWlu
dDMyX3QpLAo+ID4gKwkuZXZlbnRfaW50ZXJydXB0X2NsYXNzID0gJmV2ZW50X2ludGVycnVwdF9j
bGFzc192OSwKPiA+ICsJLm51bV9vZl93YXRjaF9wb2ludHMgPSA0LAo+ID4gKwkubXFkX3NpemVf
YWxpZ25lZCA9IE1RRF9TSVpFX0FMSUdORUQsCj4gPiArCS5zdXBwb3J0c19jd3NyID0gdHJ1ZSwK
PiA+ICsJLm5lZWRzX2lvbW11X2RldmljZSA9IGZhbHNlLAo+ID4gKwkubmVlZHNfcGNpX2F0b21p
Y3MgPSBmYWxzZSwKPiA+ICsJLm51bV9zZG1hX2VuZ2luZXMgPSAxLAo+ID4gKwkubnVtX3hnbWlf
c2RtYV9lbmdpbmVzID0gMCwKPiA+ICsJLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lID0gMiwK
PiA+ICt9Owo+ID4gKwo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBu
YXZpMTBfZGV2aWNlX2luZm8gPSB7Cj4gPiAgIAkuYXNpY19mYW1pbHkgPSBDSElQX05BVkkxMCwK
PiA+ICAgCS5tYXhfcGFzaWRfYml0cyA9IDE2LAo+ID4gQEAgLTQ1Miw2ICs0NjksOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VpZCBzdXBwb3J0ZWRfZGV2aWNlc1tdID0gewo+ID4g
ICAJeyAweDY2YTQsICZ2ZWdhMjBfZGV2aWNlX2luZm8gfSwJLyogVmVnYTIwICovCj4gPiAgIAl7
IDB4NjZhNywgJnZlZ2EyMF9kZXZpY2VfaW5mbyB9LAkvKiBWZWdhMjAgKi8KPiA+ICAgCXsgMHg2
NmFmLCAmdmVnYTIwX2RldmljZV9pbmZvIH0sCS8qIFZlZ2EyMCAqLwo+ID4gKwkvKiBSZW5vaXIg
Ki8KPiA+ICsJeyAweDE2MzYsICZyZW5vaXJfZGV2aWNlX2luZm8gfSwJLyogUmVub2lyICovCj4g
PiAgIAkvKiBOYXZpMTAgKi8KPiA+ICAgCXsgMHg3MzEwLCAmbmF2aTEwX2RldmljZV9pbmZvIH0s
CS8qIE5hdmkxMCAqLwo+ID4gICAJeyAweDczMTIsICZuYXZpMTBfZGV2aWNlX2luZm8gfSwJLyog
TmF2aTEwICovCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
