Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6F521ED7
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 22:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFD889996;
	Fri, 17 May 2019 20:04:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB55B89996
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 20:04:47 +0000 (UTC)
Received: from BYAPR12MB3384.namprd12.prod.outlook.com (20.178.55.225) by
 BYAPR12MB3239.namprd12.prod.outlook.com (20.179.93.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Fri, 17 May 2019 20:04:42 +0000
Received: from BYAPR12MB3384.namprd12.prod.outlook.com
 ([fe80::94db:e1b3:e492:1513]) by BYAPR12MB3384.namprd12.prod.outlook.com
 ([fe80::94db:e1b3:e492:1513%6]) with mapi id 15.20.1878.024; Fri, 17 May 2019
 20:04:42 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: Tejun Heo <tj@kernel.org>, "guro@fb.com" <guro@fb.com>
Subject: Re: [PATCH v2 0/4] AMDKFD (AMD GPU compute) support for device cgroup.
Thread-Topic: [PATCH v2 0/4] AMDKFD (AMD GPU compute) support for device
 cgroup.
Thread-Index: AQHVDMuol86WSWX8+kyraEU0ra1TfKZvh26AgAAznRE=
Date: Fri, 17 May 2019 20:04:42 +0000
Message-ID: <BYAPR12MB3384A590739D7E18B736CB368C0B0@BYAPR12MB3384.namprd12.prod.outlook.com>
References: <20190517161435.14121-1-Harish.Kasiviswanathan@amd.com>,
 <20190517164937.GF374014@devbig004.ftw2.facebook.com>
In-Reply-To: <20190517164937.GF374014@devbig004.ftw2.facebook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 356d80ec-20f5-43c6-0e6b-08d6db02e68d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3239; 
x-ms-traffictypediagnostic: BYAPR12MB3239:
x-microsoft-antispam-prvs: <BYAPR12MB32397F2AB8F8B049E7B790E48C0B0@BYAPR12MB3239.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(376002)(136003)(39860400002)(189003)(199004)(2906002)(256004)(229853002)(305945005)(68736007)(6246003)(64756008)(8936002)(66476007)(76176011)(73956011)(76116006)(66946007)(66446008)(66556008)(7736002)(25786009)(81166006)(81156014)(8676002)(53936002)(2501003)(4326008)(99286004)(5660300002)(14454004)(66066001)(110136005)(11346002)(6436002)(71200400001)(186003)(71190400001)(54906003)(446003)(55016002)(476003)(9686003)(486006)(26005)(33656002)(74316002)(53546011)(6506007)(6116002)(72206003)(3846002)(7696005)(316002)(102836004)(478600001)(52536014)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3239;
 H:BYAPR12MB3384.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tGcjXtz7Wmj8A7ci4oKbArfjV/ZU+7hAJPpD39W6nveb0DhrWoBG7hBP7utFUt3YTwHvzpX/UNkxK0bLf5dHcPQvCHEzos/XOqHzY7Tf6CS0hiTZs64DRc6KYUC6qTZQ03L1tN+KnPPD+SDaBUhpdn42VygnvgEG8+FoAdCEQC8iDeQacckK/orDpZ9xs+MHZGc4FO8KKomuLphWyKk10a+OWuhiE2eR8eDq5a9A39jVGdk3PKvjXF1WzL75V21Cp7xfcrd643gRl5IG8oUtq+ES7Lg6YUQfR4lJp3xIz1Vej/1m9vMR5PQ800hFTkJcWt2k1DcL0qXi6bt5eKckdAsj8ckznu+xERvGMVATS8VGaxJCKGWYHZEA0NpQJlkHZL//Mon5Z9TaNcbnpsUt4W+OckJw4y5BuV5SGiuY96w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356d80ec-20f5-43c6-0e6b-08d6db02e68d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 20:04:42.1846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3239
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuVQW9oawJ3DcRKQ4ezfVTZlaiYMBgc0rbzps9A2mw0=;
 b=JnKb7zfhRFtKJIiqywpI7a7kZnJ33Kz8Gg1OrSBLimI6bsZkdSq0c9ZEMj8HVzWM2cO31CxiAQlJAIvsyP/XQRVHLQgSfJMKaOMOHdipALl/WgKzgw+5QTHR69/uNSofMbtha9IKW/PSJVC8Wjy15BrmOTG7SZEJXxTogvoia6Q=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgVGVqdW4sCgpUaGFua3MgZm9yIGNvbW1lbnRzLiBJIGNhbiBkZWZpbml0ZWx5IGFkZCBtb3Jl
IGRvY3VtZW50YXRpb24gYnV0IGp1c3QgbmVlZCBhIGJpdCBvZiBjbGFyaWZpY2F0aW9uIG9uIHRo
aXMuCgoxKS4gRG9jdW1lbnRhdGlvbiBmb3IgdXNlciBvbiBob3cgdG8gdXNlIGRldmljZSBjZ3Jv
dXAgZm9yIGFtZGtmZCBkZXZpY2UuIEkgaGF2ZSBzb21lIG1vcmUgaW5mb3JtYXRpb24gb24gdGhp
cyBpbiBwYXRjaCA0LiAKb3IKMikgVGhlIHJlYXNvbiBkZXZjZ3JvdXBfY2hlY2tfcGVybWlzc2lv
bigpIG5lZWRzIHRvIGJlIGV4cG9ydGVkCm9yCjMpIHNvbWV0aGluZyBlbHNlIHRvdGFsbHkgdGhh
dCBJIG1pc3NlZC4KCkJlc3QgUmVnYXJkcywKSGFyaXNoCgoKRnJvbTogVGVqdW4gSGVvIDxodGVq
dW5AZ21haWwuY29tPiBvbiBiZWhhbGYgb2YgVGVqdW4gSGVvIDx0akBrZXJuZWwub3JnPgpTZW50
OiBGcmlkYXksIE1heSAxNywgMjAxOSAxMjo0OSBQTQpUbzogS2FzaXZpc3dhbmF0aGFuLCBIYXJp
c2gKQ2M6IGNncm91cHNAdmdlci5rZXJuZWwub3JnOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAvNF0gQU1ES0ZEIChBTUQgR1BVIGNvbXB1dGUp
IHN1cHBvcnQgZm9yIGRldmljZSBjZ3JvdXAuCsKgIAoKW0NBVVRJT046IEV4dGVybmFsIEVtYWls
XQoKT24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6MTQ6NTJQTSArMDAwMCwgS2FzaXZpc3dhbmF0
aGFuLCBIYXJpc2ggd3JvdGU6Cj4gYW1ka2ZkIChwYXJ0IG9mIGFtZGdwdSkgZHJpdmVyIHN1cHBv
cnRzIHRoZSBBTUQgR1BVIGNvbXB1dGUgc3RhY2suCj4gYW1ka2ZkIGV4cG9zZXMgb25seSBhIHNp
bmdsZSBkZXZpY2UgL2Rldi9rZmQgZXZlbiBpZiBtdWx0aXBsZSBBTUQgR1BVCj4gKGNvbXB1dGUp
IGRldmljZXMgZXhpc3QgaW4gYSBzeXN0ZW0uIEhvd2V2ZXIsIGFtZGdwdSBkcnZpZXIgZXhwb3Nl
cyBhCj4gc2VwYXJhdGUgcmVuZGVyIGRldmljZSBmaWxlIC9kZXYvZHJpL3JlbmRlckROIGZvciBl
YWNoIGRldmljZS4gVG8gcGFydGljaXBhdGUKPiBpbiBkZXZpY2UgY2dyb3VwIGFtZGtmZCBkcml2
ZXIgd2lsbCByZWx5IG9uIHRoZXNlIHJlZG5lciBkZXZpY2UgZmlsZXMuCj4KPiB2MjogRXhwb3J0
aW5nIGRldmNncm91cF9jaGVja19wZXJtaXNzaW9uKCkgaW5zdGVhZCBvZgo+IF9fZGV2Y2dyb3Vw
X2NoZWNrX3Blcm1pc3Npb24oKSBhcyBwZXIgcmV2aWV3IGNvbW1lbnRzLgoKTG9va3MgZmluZSB0
byBtZSBidXQgZ2l2ZW4gaG93IG5vbi1vYnZpb3VzIGl0IGlzLCBzb21lIGRvY3VtZW50YXRpb24K
d291bGQgYmUgZ3JlYXQuCgpUaGFua3MuCgotLQp0ZWp1bgogICAgCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
