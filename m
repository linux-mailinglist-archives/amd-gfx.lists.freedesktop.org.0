Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B099ADB86
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 16:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFC489930;
	Mon,  9 Sep 2019 14:51:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790080.outbound.protection.outlook.com [40.107.79.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167EA89930
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 14:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPy/n4k5n2bQDeQYcGMtIVGeqmc2+SPmboPgvT+eRbtSVhVPD3VZKqKiUlRdKFRZDkuvbkUV+pY5/G/h6RfcZECcK5c2eQwD1ff5Rkg1P0pAlozSk84PfbX0N6yMMU70d0komVIy4bw+TgEMlcR70lJ5Z5kCFbGjA6kxDeeZKtG6GES59NZwSPBRKMFFRk60QbXxK1GOhcPLUMAZtHJQELQXzQEdib5BjKUspQ5lTRbDihwHA8bCyrGLcmC/iXbDveT15wbRHuD0UqELT4dMFN6t+T8ZgcG9oUQhMxskqsEp4azP/EowtOXt13LY3ecBraemZRslkpDOs4jfJ/mMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oyCkoW4sqtmZZMg4imtfOa2NoRCJxW45Nq1ooPFm4s=;
 b=h0KinEQFC6Xhxbd/gGKWh12HYrjDxrUTQsjUUyQ7vJIdBrAJRT6edOr2ZTur97tZi2ZqZ38mDS1nPnXgKQFrsx2hdJE79KsBSV63b6Q58pPMWMjttQ6ZEd601mBTHDAxHQ87Qd54alaXavREBCrC6QmdOcrMZBMPvKgp1j5fXlo3yELcEfChpA37mwq0kkm0s3BWa1ZemIBQ+SZxHt32xn7pdtPmeg9Tr6wEDTgPOUU0ZOfES/yQEXkycWD8uYvI8gg5sw5ejGvV9TrtsJ855Gjz0hJZXJ8IJlNNZcvooYQ+1dSTBhLXJ4O707jGp/ab0RrlavFq42FsVJguZbZ3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1932.namprd12.prod.outlook.com (10.175.89.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Mon, 9 Sep 2019 14:51:33 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 14:51:33 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH] drm/amdgpu: Avoid RAS recovery init when no RAS support.
Thread-Topic: [PATCH] drm/amdgpu: Avoid RAS recovery init when no RAS support.
Thread-Index: AQHVZx3IKwK7MYRiV02Je0KugMv6qacjbekE
Date: Mon, 9 Sep 2019 14:51:33 +0000
Message-ID: <AE9B3250-DBFD-400D-AF44-4F5DD459116D@amd.com>
References: <1568040549-3664-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1568040549-3664-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [68.179.115.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb2bf74a-3832-47ff-2520-08d73535351b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1932; 
x-ms-traffictypediagnostic: DM5PR12MB1932:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB193296BFF6EEC4DCFD321E52FCB70@DM5PR12MB1932.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(189003)(199004)(966005)(25786009)(76116006)(91956017)(33656002)(14454004)(256004)(6862004)(4326008)(53936002)(71200400001)(71190400001)(305945005)(7736002)(66476007)(66556008)(81156014)(64756008)(81166006)(66446008)(478600001)(36756003)(8936002)(66946007)(486006)(6246003)(6506007)(6636002)(99286004)(37006003)(476003)(2616005)(8676002)(11346002)(66066001)(6306002)(6512007)(14444005)(26005)(6436002)(54906003)(5660300002)(102836004)(86362001)(6116002)(3846002)(229853002)(9886003)(186003)(2906002)(446003)(76176011)(53546011)(6486002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1932;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7LtiHeXUEPFRZGpLYR8cu0NGLqhlVZvVk+N7tJSC0nvxEfcHwxdxNXv0o7J9gm5aDcCtOGpWP1uAKcJuWVSBRD81KtcLKR0lSnvRJJhbyR7XMT/wKVjDTUvkNl9JrldeZnjpb5lA9r+u3EbI+cz8iazz+eWbMqEZa4js/WiVd1UYffJJ3bbRJikBiUCtx4njh5iPfRxKm2HFfZZoOCenH+IzOCVNaGgNufiYCdSjssf0oaF3P6RN5gvHqkeIH1c6O8k0esCnUyA2gIu19CJj99+cAZn1nC9nWoMdQDsY7pMb+FP5lLROdcZRVdED4qkfS8JjDbPIZ9pqe5R1Ly7ZxhekLKD8Qi4uhoyum/oR+VHwYT9eWyUbmRWwEI2OxLza5azyvwb5rGfMbXfiZRMWH+I2/yKJp0uZaMMFgtquANw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2bf74a-3832-47ff-2520-08d73535351b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 14:51:33.5665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RC1WcOpiPzru3XFPpRn3xcroBBokRpGdQvh17fNK5V/xOn02ligxhTimoFBGRRa3gqL7zks0F3UmuL9zJE+jPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oyCkoW4sqtmZZMg4imtfOa2NoRCJxW45Nq1ooPFm4s=;
 b=IE6WGCF/7oZaEQwBUXFh10oHp6QnSEbRehXGMnS5hwrUMN5YJNJRrgAyzCcHBPDEiV28bAtpEWIba0CSuw2ZEwKM0fpi8wcP4wrMwQvWTANbjQEN13YVNlgJws/5uEUmzRcASyatFy2mz/KO2DO5drVAWky/pLx26189P2HPgHo=
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KClJlZ2Fy
ZHMsCkhhd2tpbmcKClNlbnQgZnJvbSBteSBpUGhvbmUKCj4gT24gU2VwIDksIDIwMTksIGF0IDEw
OjQ5LCBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6
Cj4gCj4gRml4ZXMgZHJpdmVyIGxvYWQgcmVncmVzc2lvbiBvbiBBUFVzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+IC0t
LQo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyB8IDcgKysrKysrLQo+
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCj4gaW5kZXggZDI0MzdlMS4uMTE5YmVk
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBAQCAtMTQ5
NCw5ICsxNDk0LDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19yZWxlYXNlX2JhZF9wYWdlcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+IHsKPiAgICBzdHJ1Y3QgYW1kZ3B1X3JhcyAq
Y29uID0gYW1kZ3B1X3Jhc19nZXRfY29udGV4dChhZGV2KTsKPiAtICAgIHN0cnVjdCByYXNfZXJy
X2hhbmRsZXJfZGF0YSAqKmRhdGEgPSAmY29uLT5laF9kYXRhOwo+ICsgICAgc3RydWN0IHJhc19l
cnJfaGFuZGxlcl9kYXRhICoqZGF0YTsKPiAgICBpbnQgcmV0Owo+IAo+ICsgICAgaWYgKGNvbikK
PiArICAgICAgICBkYXRhID0gJmNvbi0+ZWhfZGF0YTsKPiArICAgIGVsc2UKPiArICAgICAgICBy
ZXR1cm4gMDsKPiArCj4gICAgKmRhdGEgPSBrbWFsbG9jKHNpemVvZigqKmRhdGEpLCBHRlBfS0VS
TkVMIHwgX19HRlBfWkVSTyk7Cj4gICAgaWYgKCEqZGF0YSkgewo+ICAgICAgICByZXQgPSAtRU5P
TUVNOwo+IC0tIAo+IDIuNy40Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
