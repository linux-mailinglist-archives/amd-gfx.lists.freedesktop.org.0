Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB09482EB6
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 11:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2188289D7F;
	Tue,  6 Aug 2019 09:31:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790087.outbound.protection.outlook.com [40.107.79.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4987889D7F
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 09:31:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFwXClnssZ+gJzQWf+9edgSkhAbpiIF2CibYTOxLrVqa78z5Tv9nxebRJYHstVfNGbXp4HG6R7Dw77l9jWhXm3szjlsA2RBCTBEHPr7KmKX6NKvxlWcNrfynq6+E23UgSS1zmB6ypcKJgtrb9jJEkHtGeonYl373L70eGhRmnGcC3smX4nAyPP39gcTjFyFrecFzLwtvsSo6DQC5yueVOa2+VhrwPRhI1i1Cwk+ZIo9WYqFPhbGrO4wMP9P53pV7aLnpYC+5E3ldHk3tLQL/ppttq18XkaLl3vmITUiUlvELl4MVk0zdjAKv4ZVK77WVvOp/4bHK2rzZJ4/kuRBZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7R+uXDXf6t58h5QgwhUU7zoSHdQfBFO3gl+dZ/C1n8=;
 b=l6RYDqDvW4B1p8TgSB5Z8fiGZIUeOzZH7xFD0M2ZInOZTCLQqZkfOYIWV9eWsTaeNXtkUPt+oOD9smqE6w9/dwwIRHTtUDJluRaqe24Zz2k0VAJZI7mei7Z1a6qzahBCAhp8+HblD7EOb/R+HluL7a85lDV914AuttM0Fsu18lz35coI0RaeJIdD7a6Dsd52iNuJyGnZ1WpQofhbbCVxa5JYA5aBFExkEYdHlaCTVbTPCrVdyUkAsYl54wD8y9+vuxDby1wFjDfTHF0kDwh4U7eRxVzvxG2SE1QSxcVYDCOp9r70CN+HKW/6ouWTIbuCNuAcBUTyOmrjxAh7ugEXxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1579.namprd12.prod.outlook.com (10.172.38.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Tue, 6 Aug 2019 09:31:45 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::35d0:926e:5405:f27e%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 09:31:45 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>
Subject: RE: [PATCH libdrm 0/3] add ras eject test for gfx and umc module
Thread-Topic: [PATCH libdrm 0/3] add ras eject test for gfx and umc module
Thread-Index: AQHVTCnHY2CK3VETJEegbXZ7P9f5dKbt2t+g
Date: Tue, 6 Aug 2019 09:31:45 +0000
Message-ID: <DM5PR12MB1418988BCA62B8D9091D7B23FCD50@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190806073629.10976-1-guchun.chen@amd.com>
In-Reply-To: <20190806073629.10976-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d349b13-7d76-4b81-30d2-08d71a50e627
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1579; 
x-ms-traffictypediagnostic: DM5PR12MB1579:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB15795F7C7E6A4A695FC7E750FCD50@DM5PR12MB1579.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(13464003)(189003)(199004)(6116002)(3846002)(76176011)(110136005)(52536014)(7696005)(99286004)(71200400001)(71190400001)(6506007)(486006)(53546011)(64756008)(66476007)(66946007)(76116006)(66556008)(66446008)(5660300002)(6436002)(316002)(66066001)(8936002)(86362001)(446003)(966005)(2501003)(6246003)(4326008)(476003)(25786009)(74316002)(102836004)(229853002)(7736002)(305945005)(33656002)(8676002)(11346002)(53936002)(478600001)(26005)(6636002)(81156014)(81166006)(14454004)(6306002)(186003)(68736007)(2906002)(9686003)(55016002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1579;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9y0WOHsAwDEOV+ORe1hfA52uWB82bv+AJpXh2Lkfm3bc25utzodMNqxnBdks7A/poiSKWr2VclQDdv0QVFI8qcKY0uCnB/1MCGPArovFiEeh2frhrWHaXjzWwbnvKN+He5HxiduVEvTMPpN0JS1smswZKLZDK1pl5vgXQvZwhtS8i9dV8GMuSWB1PhQdKfPPmcdpplxck7eCvYJD04r2CFnxpPWiWADBgS6WltPaCO46djRsgHJ3rQlKgzPe4fU04R7BpkYdiqxDSmNuL9gnnA01hM51qElRFBR/ecbyTsxYsKE3MCSScsBgBIvQscAmY+yOsJZeXe6FxAqWHDQJcFZZhkd7VSBPm+InLW8nmxjpFHJJWHj3vT9N53eEMcLWvJaDDv0psYDl5ycIW6JEsKUlG2sTJRNHP/BckFwkgg4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d349b13-7d76-4b81-30d2-08d71a50e627
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 09:31:45.5419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7R+uXDXf6t58h5QgwhUU7zoSHdQfBFO3gl+dZ/C1n8=;
 b=JD3C5QCL0uNRnuAPm6uFbYCBcSLW+g9pzcQbx1IbwRHYSEQqx6II+1cP2FRnL+Ek5HaOwSaK+1OM7pXBRpFd3xHdOwi6EdcEbKEZd58ppGY5WFEejIjlxi/4QgFLjJvOlZ7im5Jl0UQpVp3/bkdiFhoRqPcOQoBiqbNT9cFVcOs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2Ugc2hhbGwgYWRkIGJhY2sgdW1jIG11bHRpLXVuY29ycmVjdGFibGUgZXJyb3IgaW5qZWN0aW9u
IGluIGRlZmF1bHQgY29uZmlnIGZpbGUuIFdpdGggdGhhdCBmaXhlZCwgdGhlIHNlcmllcyBpcw0K
DQpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KDQpS
ZWdhcmRzLA0KSGF3a2luZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1k
LWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEd1Y2h1biBDaGVuDQpTZW50OiAyMDE55bm0OOaciDbml6UgMTU6MzYNClRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNv
bT47IExpLCBEZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsgUGFuLCBYaW5odWkgPFhpbmh1aS5Q
YW5AYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPg0KQ2M6IENoZW4sIEd1
Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCBsaWJkcm0gMC8zXSBh
ZGQgcmFzIGVqZWN0IHRlc3QgZm9yIGdmeCBhbmQgdW1jIG1vZHVsZQ0KDQpUaGVzZSBwYXRjaGVz
IGFyZSB0byBzdXBwb3J0IHJhcyBlamVjdCB0ZXN0IGZvciBnZnggYW5kIHVtYyBtb2R1bGVzLg0K
DQpHdWNodW4gQ2hlbiAoMyk6DQogIGFtZGdwdTogYWRkIGdmeCByYXMgZWplY3QgY29uZmlndXJh
dGlvbiBmaWxlDQogIHRlc3RzL2FtZGdwdS9yYXM6IHJlZmluZSByYXMgZWplY3QgdGVzdA0KICBh
bWRncHU6IGFkZCB1bWMgcmFzIGVqZWN0IHRlc3QgY29uZmlndXJhdGlvbg0KDQogY29uZmlndXJl
LmFjICAgICAgICAgICAgIHwgIDE4ICsrDQogZGF0YS9hbWRncHVfcmFzLmpzb24gICAgIHwgMjYw
ICsrKysrKysrKysrKysrKysrKysrDQogbWVzb24uYnVpbGQgICAgICAgICAgICAgIHwgICAxICsN
CiB0ZXN0cy9hbWRncHUvTWFrZWZpbGUuYW0gfCAgIDUgKy0NCiB0ZXN0cy9hbWRncHUvbWVzb24u
YnVpbGQgfCAgMTYgKy0NCiB0ZXN0cy9hbWRncHUvcmFzX3Rlc3RzLmMgfCA1MjAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQogNiBmaWxlcyBjaGFuZ2VkLCA3NjkgaW5z
ZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQgZGF0YS9hbWRn
cHVfcmFzLmpzb24NCg0KLS0NCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
