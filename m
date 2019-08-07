Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7887842EB
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 05:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01B46E5DE;
	Wed,  7 Aug 2019 03:31:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720055.outbound.protection.outlook.com [40.107.72.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426F86E5E6
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 03:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lElniQXwqdKJ90gdgk++iZwRYczLtyNkzhvvnW0NsyqujlZuAgw4wf5dvB+6R34FEne2FV7G9WxtH8F64qTLVRe4n+Q1vXqq5JpNJujKOlJOXRFQfhAqX9hGVkyoXk/20Fe08VK9kLxGlsO7uLRRCEYE+ACk+jiCOjp18qcyJTkR6x7LFCbkY4yyNofTfRRqEZMJtdFIVeRkY1n8nZ3ZLtaHwibZiAuDdKhVzYzPGYf9T4CN+lNunYzS8YDZ/RmFGI8/r2jO1QYfFo5qFjiZHsNqFNF+YydL0fIA59VbWyskYgx3gkd5G0TtxYv9G7rlH0xaBJIqxb83CFqKcnTEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFTqavC5bZ0Xn9zq9zxHp549mm/WODx/cknwVAJtx28=;
 b=nN2rc59Xli30jpTjDgv4DoGA/4TCtTzkIGgeHWx4CsmhtFc7jRFhT+GvpfQzmKGvbXIDKsy3lf6H/wGoThiKtslYNp05S4/DPbDNcijNdpmVhbuitj8heo50TJI79gDN9i9uXImHKeDkPkBI/BIc/VzC511rs/kMN4ORrj2BZ5eSShOj7+B+G7bW28t5bujwQWwi6OOZmBkvA+JU8/F82lLX3zIgtxEqCTwq4Cfyw9Qs9fKhE0RpoQXum707V/dhWBjBO8QKxz/AvYAab6/7WkwGcSC5shlCh8Wer3leeguhqroO2Qiwy5B60NBegj/MvCPXlcarLTUMBu6KPBjHFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
Received: from BYAPR03MB4773.namprd03.prod.outlook.com (20.179.92.152) by
 BYAPR03MB3591.namprd03.prod.outlook.com (52.135.213.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Wed, 7 Aug 2019 03:09:07 +0000
Received: from BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::a517:3578:67bf:6c88]) by BYAPR03MB4773.namprd03.prod.outlook.com
 ([fe80::a517:3578:67bf:6c88%7]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 03:09:05 +0000
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Tao Zhou <tao.zhou1@amd.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Thread-Topic: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Thread-Index: AQHVTMvKn2cibV5eE0W0lKhtRWOdxKbu/lEA
Date: Wed, 7 Aug 2019 03:09:05 +0000
Message-ID: <20190807105759.58a28ef0@xhacker.debian>
References: <20190807025640.682-1-tao.zhou1@amd.com>
In-Reply-To: <20190807025640.682-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [124.74.246.114]
x-clientproxiedby: TY1PR01CA0187.jpnprd01.prod.outlook.com (2603:1096:403::17)
 To BYAPR03MB4773.namprd03.prod.outlook.com
 (2603:10b6:a03:134::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c31620f-20a0-45f8-5338-08d71ae49afe
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR03MB3591; 
x-ms-traffictypediagnostic: BYAPR03MB3591:
x-microsoft-antispam-prvs: <BYAPR03MB3591255330BF4B15E84689F2EDD40@BYAPR03MB3591.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:651;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(136003)(39860400002)(396003)(376002)(189003)(199004)(54906003)(6116002)(76176011)(3846002)(52116002)(99286004)(386003)(71200400001)(64756008)(66946007)(71190400001)(66446008)(486006)(6436002)(5660300002)(66066001)(7416002)(6506007)(316002)(66476007)(66556008)(476003)(11346002)(6246003)(8936002)(86362001)(50226002)(4326008)(446003)(25786009)(6486002)(1076003)(7736002)(102836004)(229853002)(305945005)(8676002)(6916009)(53936002)(6512007)(256004)(26005)(2906002)(81166006)(14454004)(186003)(478600001)(81156014)(68736007)(9686003)(39210200001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR03MB3591;
 H:BYAPR03MB4773.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DkaHdeJ+NUkEmC+oRl0E+NCwmmXtfEwK09OW1TGDF6lgO7ekqytTnoAf/Pl+/BnjxOmifumz8z1YQ6fjU5DqN0TyAwPPxOoM4vWit2vhNwMA9rXXkkWd7cRJHx2A3gnK5tl35JPnjgbPr5/RvnkoNKYP3d5+NlTwian9V+4nk3ZLDqrDsqhrSOEZc9iTfIcu//NMlt9novH7mLtxtPYe5M5gWY5FG4EDEI8ILu7lWDwuXgFFrRiIIVsGYmKbSWkAjvifkTJyTMkftP6TLmJYnB/sfnngr29BBrv9N5z4m6ZTHAwIZGlPF+7QDtQQJyHoBt4JLrV85DzSE/W+kk6SUUeHJC4UllNKl80gT+fjEUBBQPzWhhmyunKjGQn1aIgFzKzYRJciPhRJwAWb32ABK7YupDeuY7ieAWJJzGEQ7dI=
x-ms-exchange-transport-forked: True
Content-ID: <5E427FF48ECA554D95F17DF5415C85A3@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c31620f-20a0-45f8-5338-08d71ae49afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 03:09:05.3437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jiszha@synaptics.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3591
X-Mailman-Approved-At: Wed, 07 Aug 2019 03:31:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFTqavC5bZ0Xn9zq9zxHp549mm/WODx/cknwVAJtx28=;
 b=M1lPi+2xEOMhM3ptRgkvEHZ5EUOVbJUlnuI4TmYLNaE3YdvdJpSqr7OQQZ+l0aqIuAs3Bt2TDrA/+ayxxyhs/GOGdOiDHrnQgCKuzqmSRxty0eMqeimmOLBQS4CG3TbLbJcnlYqkQsHR/LwHRgaXEomdSZEOd0wXIserh19qQUs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jisheng.Zhang@synaptics.com; 
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kernel-build-reports@lists.linaro.org"
 <kernel-build-reports@lists.linaro.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dennis.li@amd.com" <dennis.li@amd.com>,
 "hawking.zhang@amd.com" <hawking.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCA3IEF1ZyAyMDE5IDEwOjU2OjQwICswODAwIFRhbyBaaG91IHdyb3RlOgoKCj4gCj4g
Cj4gcmVhZHEvd3JpdGVxIGFyZSBub3Qgc3VwcG9ydGVkIG9uIGFsbCBhcmNoaXRlY3R1cmVzCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA4ICsrLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDU1OGZlNmQw
OTFlZC4uN2ViOWUwYjkyMzVhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYwo+IEBAIC0yNzIsMTQgKzI3MiwxMCBAQCB2b2lkIGFtZGdwdV9tbV93cmVn
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCByZWcsIHVpbnQzMl90IHYsCj4g
ICAqLwo+ICB1aW50NjRfdCBhbWRncHVfbW1fcnJlZzY0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCB1aW50MzJfdCByZWcpCj4gIHsKPiAtICAgICAgIHVpbnQ2NF90IHJldDsKPiAtCj4gICAg
ICAgICBpZiAoKHJlZyAqIDQpIDwgYWRldi0+cm1taW9fc2l6ZSkKPiAtICAgICAgICAgICAgICAg
cmV0ID0gcmVhZHEoKCh2b2lkIF9faW9tZW0gKilhZGV2LT5ybW1pbykgKyAocmVnICogNCkpOwo+
ICsgICAgICAgICAgICAgICByZXR1cm4gYXRvbWljNjRfcmVhZCgoYXRvbWljNjRfdCAqKShhZGV2
LT5ybW1pbyArIChyZWcgKiA0KSkpOwoKYXRvbWljNjRfcmVhZCBkb2Vzbid0IGVxdWFsIHRvIHJl
YWRxIG9uIHNvbWUgYXJjaGl0ZWN0dXJlcy4uCgo+ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAg
ICAgICBCVUcoKTsKPiAtCj4gLSAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gCj4gIC8qKgo+IEBA
IC0yOTQsNyArMjkwLDcgQEAgdWludDY0X3QgYW1kZ3B1X21tX3JyZWc2NChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgdWludDMyX3QgcmVnKQo+ICB2b2lkIGFtZGdwdV9tbV93cmVnNjQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHJlZywgdWludDY0X3QgdikKPiAgewo+
ICAgICAgICAgaWYgKChyZWcgKiA0KSA8IGFkZXYtPnJtbWlvX3NpemUpCj4gLSAgICAgICAgICAg
ICAgIHdyaXRlcSh2LCAoKHZvaWQgX19pb21lbSAqKWFkZXYtPnJtbWlvKSArIChyZWcgKiA0KSk7
Cj4gKyAgICAgICAgICAgICAgIGF0b21pYzY0X3NldCgoYXRvbWljNjRfdCAqKShhZGV2LT5ybW1p
byArIChyZWcgKiA0KSksIHYpOwo+ICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICBCVUco
KTsKPiAgfQo+IC0tCj4gMi4xNy4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
