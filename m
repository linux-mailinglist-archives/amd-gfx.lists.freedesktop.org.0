Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE09B836
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 23:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DC86ED46;
	Fri, 23 Aug 2019 21:33:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855BD6ED46
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 21:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0ORPBHYn3ydvBpW7uREOGqicik1bK7Tn4ekBzbxKDHHVu2d323nA+0QEywv13sTExGxkB+C6Qyp5IFyUbGWDAOofY4Vu/imyJuG4ZT0k/xWlnCWHGKBT8eU4YgMlsm8qOEvcPBCk+m6VI0Kh7BkbAYfxo/OUiIzvqDEpdkMzTVOCw1R4VjMxvlRCymPWTSCMTS7QxjoWexaFC+kbjxUgvkiQVxlQNP6n+LlZTU0IdvTFcLXvMwAEls8YcqL2Rj0WEOCHK09iroczJiOtteWXWNKuBYIKMUIwTvwAhE1XpxVSap6eNY863Dt4LDbwxl9cvbNDPqJS+Myy36AmTdRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7BqDr0kMDnxDcjFp8/X0Y4IYF+Qr30qw95yGDfhp9Y=;
 b=eyJNo85J8kGlod6XGaPu+omvgY5hBzmTwjmscYYD2CC6CEbpp024c0CRGxMB88qZYUocOTs1symnt6lH3czZb7e9S9m0dZovtVffqNCa5OquZSfuYF8rAwvkBCWaO30cyD5Fp3xcYxG0e5EDTwLxU90EGqMb0RruauiTOTZeq4B8jhc6K9ekV3RiwAXs6zbbVWCPtcSD4VOyvZ3XTxycbR/R6hf5I/a6ycg+5+O9rXboiyMeBMzyt0NDXfd4TnXj4iT9bOuG7oB0Olgf5KHfHBCDNzHOYau7hE/8Fvh9F7DOPBJZ/ZJ2SFcmAkRGHGcNosXFD5VJYHdrK4DYqbLu8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3644.namprd12.prod.outlook.com (20.178.199.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 21:33:46 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 21:33:46 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/4] KFD: Mapping-specific MTYPEs on Arcturus
Thread-Topic: [PATCH 0/4] KFD: Mapping-specific MTYPEs on Arcturus
Thread-Index: AQHVWfpxKHLPoleOp0CW4iGzFgF7kA==
Date: Fri, 23 Aug 2019 21:33:45 +0000
Message-ID: <20190823213249.10749-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YT1PR01CA0030.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::43)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3f0a258-fdeb-47da-c1df-08d7281193cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3644; 
x-ms-traffictypediagnostic: DM6PR12MB3644:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3644294EC6753C44DF3D5A2F92A40@DM6PR12MB3644.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(199004)(189003)(50226002)(478600001)(86362001)(2616005)(4326008)(26005)(486006)(186003)(386003)(5640700003)(52116002)(66066001)(25786009)(81156014)(2906002)(14454004)(102836004)(54906003)(6916009)(66476007)(4744005)(7736002)(2501003)(66946007)(66446008)(5660300002)(36756003)(6506007)(8676002)(8936002)(81166006)(6436002)(53936002)(71190400001)(6512007)(316002)(3846002)(6116002)(6486002)(476003)(66556008)(64756008)(71200400001)(305945005)(1076003)(99286004)(2351001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3644;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0Lx27ekE3tIiIIxRvfoSzqSlW0bwaj3oTn5KS+yAL56N4JIcpDOHSIKyp17DDZSfz1BD4QOOHyaEpLpCy9mMp+Kig4lrODh4rTUG8z+I4tl02eXJllBWcNeVWGL88KNnSb72s3Cdfoc31EdTgkFOrAvBhRI0P5RCpUuv82NPNEr+7Cb65WnkA6nyNL6GSOYwPGxYfjWlg/8ovsNDT04W4nS5Itclh5AK2T+POB8GOCxAsuxQC/du+1C35fywrcUZEAK4w7+wyHBWWzYhjaGI5jWvmnu8Zxs5ETdsWnWu9qaVn1Ppq2E7xPhAdIpP8QzcP5q9nKiKDfWAz/WG/byqVnC8JVwMw3JugJGLlzvvxggCs/JrBDkbQi3GeYdoKeIRwWvC89AoHVblj0FLOudh4V8+YFYWKNpCGOOnUxWq88E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f0a258-fdeb-47da-c1df-08d7281193cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 21:33:45.8347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hcQRCSwl+NinSczJT4pahGiDbj16oKWblzbCBGYqRHKLFT3zjz1RGfB/xS4L47XIPay3KggQtnzdRlT/XJES4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3644
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7BqDr0kMDnxDcjFp8/X0Y4IYF+Qr30qw95yGDfhp9Y=;
 b=wGYeFsYTqz/UvdLagc+nSedQk9CP2qMAKINI0BlZ7VGtSZq+Rqov5k3jUbMNkGbT8DAgIEXNzrqVrEuUEsUbfTYuhIyJDUYqw/MMUccg+qrxWxZShfprFFTyA+7KIMDMFyyj2yCmdEToiuFqQdhwtRIWXhkNuS3Xo8ATqW1CIBI=
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyBhIHNpbXBsaWZpZWQgdmVyc2lvbiBvZiBPYWsncyBwYXRjaCBzZXJpZXMsIGFkZHJl
c3Npbmcgc29tZSBvZgp0aGUgY29uY2VybnMgcmFpc2VkIGR1cmluZyBjb2RlIHJldmlldy4gUGF0
Y2hlcyAxLTMgYXJlIHRha2VuIGRpcmVjdGx5CmZyb20gT2FrJ3Mgc2VyaWVzLiBQYXRjaCA0IGlz
IGEgc2ltcGxpZmllZCB2ZXJzaW9uIG9mIE9haydzIHBhdGNoZXMKMyBhbmQgNSB0aGF0IGtlZXBz
IGFsbCB0aGUgS0ZEIG1lbW9yeSB0eXBlIGFic3RyYWN0aW9ucyBvdXQgb2YgdGhlIEdNQwpJUC12
ZXJzaW9uLXNwZWNpZmljIGNvZGUuCgpDb21waWxlIHRlc3RlZCBvbmx5LgoKRmVsaXggS3VlaGxp
bmcgKDEpOgogIGRybS9hbWRncHU6IERldGVybWluZyBQVEUgZmxhZ3Mgc2VwYXJhdGVseSBmb3Ig
ZWFjaCBtYXBwaW5nCgpPYWsgWmVuZyAoMyk6CiAgZHJtL2FtZGdwdTogRXh0ZW5kcyBhbWRncHUg
dm0gZGVmaW5pdGlvbnMKICBkcm0vYW1kZ3B1OiBTdXBwb3J0IG5ldyBhcmN0dXJ1cyBtdHlwZQog
IGRybS9hbWRncHU6IFN1cHBvcnQgc25vb3BlZCBQVEUgZmxhZwoKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaCAgICB8ICAyICstCiAuLi4vZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyAgfCA2MCArKysrKysrKysrKysrKy0tLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaCAgICAgICAgfCAgOSArKy0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgICAgICAgICB8ICA2ICsrCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2luY2x1ZGUvdmVnYTEwX2VudW0uaCAgICAgfCAgMSArCiBpbmNsdWRlL3Vh
cGkvZHJtL2FtZGdwdV9kcm0uaCAgICAgICAgICAgICAgICAgfCAgNCArKwogNiBmaWxlcyBjaGFu
Z2VkLCA2MyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
