Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED54CBE26
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 16:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A4689D46;
	Fri,  4 Oct 2019 14:55:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790078.outbound.protection.outlook.com [40.107.79.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C9D89343
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 14:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWUCyL1GG/lIHRvvb0qIrvPL2n6TGL2dZa0x4cm5wLGzq1KaKBiwOYZWADmqplI+wPC+x1k2AnMVOh0/rTUlUG5xA1qh9ybXXnnfgDoDthHj691r0NQ9sePu5FF/2Vhjbb5JNw4kwCbYkU/oSI8isdTVemwWu/Mp8o8Z7/MPHpoI/XoUiqRX3tVfci/ZO+1ugwtjtQ+Se/hJMQl3A7qa37goEA9Z+w24LO5cOeU0re1heUpdDcwMti0vmOMC9T/MiDu7CJvKHmSUVzr/55a38cjCgtTtcKjrFD02BCB57WSaBeCrltqRHWo1WNVMX72vPixj4gxanJChTt5R1QLbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIcGK3Xf17kNDbh1rwHgpg7G+nK09FGBD194smr1I9Y=;
 b=VwIbMAkSH2CZtx/dCFGk4wdEJQK4WXa9jliOud8aXwKbh7negQAnLRGsj99n25t+o7BspkFGTRCTRPoX0n20DV5gPQoD4BcpvjOQMaHeIODZhlKg0+tjTND8rOGbQs1SL8kes82BijzQZ1AGr9k48nmQJnSSznMWbdIPvRRjrnd0CTgFuoiOUP21oafO+oIM6hMiu7OBOpdWfxZBuzH3ZZFVkU47dORSCZ+KRjH5OEkcIXHICcSoGztDBSXjFTod1cGbHUu5ovcVNxInWkNXJlSbSE38HytI4twNCS2oL7eU4jaaJCOar4sAb4Jg0/D1uqycx3WbUsJqFDqhDhg6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2937.namprd12.prod.outlook.com (20.179.104.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Fri, 4 Oct 2019 14:55:07 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::b5e5:7607:69b9:620a]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::b5e5:7607:69b9:620a%5]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:55:07 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdkfd: Print more sdma engine hqds in debug fs
Thread-Topic: [PATCH 2/2] drm/amdkfd: Print more sdma engine hqds in debug fs
Thread-Index: AQHVesLV0Ol0u7INHkiIs2/TzKWLf6dKkeMA
Date: Fri, 4 Oct 2019 14:55:06 +0000
Message-ID: <36a3d627-6b18-de6b-ccdd-a4e96eb30b68@amd.com>
References: <1570200515-18992-1-git-send-email-Oak.Zeng@amd.com>
 <1570200515-18992-2-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1570200515-18992-2-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTOPR0101CA0067.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::44) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6e7cd65-4b66-4aa7-9e30-08d748dad863
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2937:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2937B8B7D3BEA069ABA5D02C929E0@DM6PR12MB2937.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(199004)(189003)(58126008)(4326008)(14454004)(86362001)(7736002)(26005)(305945005)(186003)(36756003)(25786009)(478600001)(6246003)(64756008)(316002)(66946007)(66476007)(66556008)(6512007)(31696002)(99286004)(110136005)(66446008)(6436002)(2501003)(31686004)(3846002)(6116002)(5660300002)(256004)(14444005)(446003)(102836004)(8676002)(8936002)(81166006)(476003)(2616005)(229853002)(11346002)(52116002)(81156014)(6506007)(53546011)(386003)(76176011)(71200400001)(65956001)(65806001)(71190400001)(66066001)(2906002)(486006)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2937;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l2sDb4bxi2yNd5AkVzE36qq3gakYDQLEG3tSgd6XDxzVNoxGkjNWDVsi3YfXNMsCU1+5BKkKAEYp0KDPMaAKv41Ds+L1bnOdSzv2AcrcU4wxhFDGvWOfKWBTiPb0H8QPt3D9aEQbkfs22isCZA4rFR1RvKYxOZQfKooQ1CNFueXKFiOAOCT8ZSxCwLlkuZ8woh5UUbVh4khBpTcUWnWxyE88ziPldE5WG35npmr8QHN23Slb+T3yn/HMZznPY9wEb9HEScC+5a+kio/X8kNBZ6lnP4m6VRQGhzi3KauzLdvUIJASyF850K3FdQcWdz9AiwXodGnnIjWPIUZUzCtS80pPfwuQVlxZHWL5tLYQXUAKuyHWykzkZx+5X+3aj3OjnsxZXPc8Wm9Ssa6WYID5sGi5JL1rNHyBJM+OgZZn9c8=
Content-ID: <3E287B452E8E2146B826382F2C928C4E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e7cd65-4b66-4aa7-9e30-08d748dad863
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 14:55:06.9280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2+sOASYl0u0dtQ4F7CV4382WKXKsJ5ztcKghLXfp8Q8P9j5TRQ8WPzPujAYJGULES+Xep3ECErwRD7qU5h0Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2937
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIcGK3Xf17kNDbh1rwHgpg7G+nK09FGBD194smr1I9Y=;
 b=oYOO/eXiCfk+2/KbUBT0eYY6cY5LXI6oJpqmxH0oxBU3tPToopihtREm+fw9jjaXNibbsppwLDhSuBBIrtJHiVHsDEOKikqaF907JSXejyyjlkoX0stjEHUcaPe9NGr0j1mfhdToXGQCRNXhM/tLIlNDh53mwvd5hot1N4qRmX8=
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
Cc: "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0wNCAxMDo0OCwgWmVuZywgT2FrIHdyb3RlOg0KPiBQcmV2aW91c2x5IG9ubHkg
UENJZS1vcHRpbWl6ZWQgU0RNQSBlbmdpbmUgaHFkcyB3ZXJlDQo+IGV4cG9zZWQgaW4gZGVidWcg
ZnMuIFByaW50IGFsbCBTRE1BIGVuZ2luZSBocWRzLg0KPg0KPiBDaGFuZ2UtSWQ6IEkwMzc1NmZj
MGZhOTkxNjlkODhlMjY1NTYwZjUwNWVkMTg2MjQyYjAyDQo+IFJlcG9ydGVkLWJ5OiBKb25hdGhh
biBLaW0gPEpvbmF0aGFuLktpbUBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBL
aW0gPEpvbmF0aGFuLktpbUBhbWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2Fr
LlplbmdAYW1kLmNvbT4NCk1pbm9yIGNvc21ldGljIG5pdC1waWNrIGlubGluZSB0aGF0IGNoZWNr
cGF0Y2gucGwgd291bGQgcHJvYmFibHkgd2FybiANCmFib3V0LiBXaXRoIHRoYXQgZml4ZWQsIHRo
aXMgcGF0Y2ggaXMNCg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGlu
Z0BhbWQuY29tPg0KDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IGluZGV4IGU1NWQwMjEu
LjBlYmM2MDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQo+IEBAIC0yNDE2LDcgKzI0MTYsNyBAQCBpbnQg
ZHFtX2RlYnVnZnNfaHFkcyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpDQo+ICAgCQl9
DQo+ICAgCX0NCj4gICANCj4gLQlmb3IgKHBpcGUgPSAwOyBwaXBlIDwgZ2V0X251bV9zZG1hX2Vu
Z2luZXMoZHFtKTsgcGlwZSsrKSB7DQo+ICsJZm9yIChwaXBlID0gMDsgcGlwZSA8IGdldF9udW1f
c2RtYV9lbmdpbmVzKGRxbSkgKyBnZXRfbnVtX3hnbWlfc2RtYV9lbmdpbmVzKGRxbSk7IHBpcGUr
Kykgew0KDQpUaGlzIGxpbmUgbG9va3MgbG9uZ2VyIHRoYW4gODAgY2hhcmFjdGVycy4gVHJ5IHRv
IGZpbmQgYSBnb29kIHBsYWNlIHRvIA0KYnJlYWsgaXQuDQoNCg0KPiAgIAkJZm9yIChxdWV1ZSA9
IDA7DQo+ICAgCQkgICAgIHF1ZXVlIDwgZHFtLT5kZXYtPmRldmljZV9pbmZvLT5udW1fc2RtYV9x
dWV1ZXNfcGVyX2VuZ2luZTsNCj4gICAJCSAgICAgcXVldWUrKykgew0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
