Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84A69D9E
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD35E89BB2;
	Mon, 15 Jul 2019 21:21:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710053.outbound.protection.outlook.com [40.107.71.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2587D89BC0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDDNKybasrPii2MaQFPVXXMaZd7Rp1yYn8US5a0RfsIUDyO3raq6jJAF4Ufu0XxDVvNQt7ASTwih1mJHwf8XzIAWlBKvn9jD3gfhAl+EtatjWNG+yZf6CH5b5K7ylvskk79nLopqNgy3Set6Xah7Svjy5fE9NLpneQo57kRSGoaLVf/oHAa4CnVvNbASHChfi4DVxGSq1Hxcn03vLP2pxPmPRlaTMoE4kdDVXk6Y9nq6TziHDJJpxZS57cmAHmMC9v4YasOpLpXJoPg4sU34TOVBcrN0j/8ODMXpJdaxhHVobVfql691dclFLpB7qABnQWRQHN2jLn74R9n9Pd9rBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7okOAuCHFJKRCGqFhSEwd9tgLcFzV+32nCAbUpzASo=;
 b=I3a6hZlV2xQyRpux5+ACUlWgy44b734aw899KR3rk9RtTdHBfd4E47eOLYnTgvuJuzvVAkenLmbxTxnRSgywoPOAUKKaF3Hm8o6uidSM7n+kHXGvqu+WIqqerRXjAwxOR09rnk7C7nXLt62y7+RAZHmK0dXjHpLMP83YIrCXW/SJDwLja1gtdkHVmXDq8aCPaB8NuPSvJ2Y55CntPpES7WQt+rZzeaNz4ZKc01oXYgN1w2vut1mn54HKmthqIFn1mhjHx4FbJTE4RGytcIxHNlXUK0h4u8HNWuQkqt22Mo1x0YJBodJS4WyUO31Jl5ErynrawLXkBE4XkkWe4hs8tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0042.namprd12.prod.outlook.com (2603:10b6:301:2::28)
 by MWHPR12MB1936.namprd12.prod.outlook.com (2603:10b6:300:114::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Mon, 15 Jul
 2019 21:21:18 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0042.outlook.office365.com
 (2603:10b6:301:2::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:18 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:18 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:07 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/87] drm/amd/display: early return when pipe_cnt is 0 in bw
 validation
Date: Mon, 15 Jul 2019 17:19:34 -0400
Message-ID: <20190715212049.4584-13-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(356004)(6666004)(2870700001)(5660300002)(2351001)(50466002)(48376002)(70206006)(426003)(70586007)(76176011)(486006)(51416003)(446003)(26005)(6916009)(11346002)(476003)(14444005)(316002)(336012)(8936002)(126002)(2616005)(50226002)(54906003)(81156014)(81166006)(86362001)(186003)(2876002)(4326008)(478600001)(68736007)(49486002)(8676002)(53936002)(36756003)(305945005)(1076003)(47776003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1936; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02fb2c22-b9fe-4f6e-01be-08d7096a609d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1936; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1936:
X-Microsoft-Antispam-PRVS: <MWHPR12MB19366710CD6202D03DD7176A82CF0@MWHPR12MB1936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rv4f9EF2UBdBCuC11YWV42UnC9I/me8k7xBNp3/yal4ZrnvbBUeIVnnJOS0MQ5b9CBdWhwjFyRewYXJwv0IBDpftUMCI7Z35rJt23bCm39wpbNveMu/TiW/IZSEvIAapfDH2gk1o0GaxdHxxecdssBd21gpGiVuZi/XAZNQYp54E9gPCNujIJ+tzNAlC2lT1KyIsPfgvHNuiMRki49EIk85+Dc3KZIMwG7tdxxK65WAacExxa3JXcLIlGnrD4DikWo4m+RZohQ8BxjXg+7eW5Qc2IBgsdfoxMpqwBzMbKnOWASbZp89lqUN+2hJ8JYmqh30SSZE86li/DRBXI/3bKiFsh0D5Nmpg3IO7CT7i8ZO+Zn+ovVLy9vFxd6iEQHNGyJsh4fPgM42fqPsUezh2udN12wXpyjINCON2oJ5VEPA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:18.6278 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fb2c22-b9fe-4f6e-01be-08d7096a609d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1936
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7okOAuCHFJKRCGqFhSEwd9tgLcFzV+32nCAbUpzASo=;
 b=kzUb1pEzsuRp0HpiNnk+z1lPC4RxB8/QxCbalB2z2DU3CAvl07squ8rflz56Y9y5toor+8HL92f5IyuorXqIoGl8NGPLtnpncebQNSk+VdsdyPeisS29InyxLXUhhHotZupCvjNBvjLHeC7t8MAiIfjRDT6HqQT032PsGiMVEH8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, Tony Cheng <tong.cheng@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpVbmludGVudGlvbmFs
bHkgaW50cm9kdWNlZCBiZWhhdmlvdXIgY2hhbmdlIGZyb20gcHJldmlvdXMgcmVmYWN0b3IsCndo
aWNoIGNhdXNlcyBjbGtzIHRvIGJlIDAgaW4gbm8gc3RyZWFtIGNhc2VzLCB3aGljaCB3aWxsIGNh
dXNlCmRpdmlkZSBieSAwLgoKW0hvd10KU2tpcCBjYWxjdWxhdGlvbiBvZiBjbG9ja3Mgd2hlbiBu
byBzdHJlYW0uIFdoaWNoIGlzIHRoZSBzYW1lIGFzIG9sZApiZWhhdmlvdXIuCgpTaWduZWQtb2Zm
LWJ5OiBFcmljIFlhbmcgPEVyaWMuWWFuZzJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFRvbnkgQ2hl
bmcgPHRvbmcuY2hlbmdAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jIHwgOCArKysrKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBkMDdkMzVhOWRkMGEuLjAyMmQwZjM4NzIz
YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3Jlc291cmNlLmMKQEAgLTIwMjAsNiArMjAyMCw3IEBAIGJvb2wgZGNuMjBfZmFzdF92YWxp
ZGF0ZV9idygKIAkJc3RydWN0IGRjICpkYywKIAkJc3RydWN0IGRjX3N0YXRlICpjb250ZXh0LAog
CQlkaXNwbGF5X2UyZV9waXBlX3BhcmFtc19zdCAqcGlwZXMsCisJCWludCAqcGlwZV9jbnRfb3V0
LAogCQlpbnQgKnBpcGVfc3BsaXRfZnJvbSwKIAkJaW50ICp2bGV2ZWxfb3V0KQogewpAQCAtMjA3
Miw2ICsyMDczLDggQEAgYm9vbCBkY24yMF9mYXN0X3ZhbGlkYXRlX2J3KAogCQlwaXBlX2NudCA9
IGRjbjIwX3BvcHVsYXRlX2RtbF9waXBlc19mcm9tX2NvbnRleHQoZGMsCiAJCQkmY29udGV4dC0+
cmVzX2N0eCwgcGlwZXMpOwogCisJKnBpcGVfY250X291dCA9IHBpcGVfY250OworCiAJaWYgKCFw
aXBlX2NudCkgewogCQlvdXQgPSB0cnVlOwogCQlnb3RvIHZhbGlkYXRlX291dDsKQEAgLTI0MzIs
NyArMjQzNSwxMCBAQCBib29sIGRjbjIwX3ZhbGlkYXRlX2JhbmR3aWR0aChzdHJ1Y3QgZGMgKmRj
LCBzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQsCiAKIAlCV19WQUxfVFJBQ0VfQ09VTlQoKTsKIAot
CW91dCA9IGRjbjIwX2Zhc3RfdmFsaWRhdGVfYncoZGMsIGNvbnRleHQsIHBpcGVzLCBwaXBlX3Nw
bGl0X2Zyb20sICZ2bGV2ZWwpOworCW91dCA9IGRjbjIwX2Zhc3RfdmFsaWRhdGVfYncoZGMsIGNv
bnRleHQsIHBpcGVzLCAmcGlwZV9jbnQsIHBpcGVfc3BsaXRfZnJvbSwgJnZsZXZlbCk7CisKKwlp
ZiAocGlwZV9jbnQgPT0gMCkKKwkJZ290byB2YWxpZGF0ZV9vdXQ7CiAKIAlpZiAoIW91dCkKIAkJ
Z290byB2YWxpZGF0ZV9mYWlsOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuaAppbmRleCAyYjM2OTJlMGM0OGQuLjQ0Zjk1YWEw
ZDYxZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3Jlc291cmNlLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmgKQEAgLTEyMCw2ICsxMjAsNyBAQCBib29sIGRjbjIwX2Zhc3RfdmFs
aWRhdGVfYncoCiAJCXN0cnVjdCBkYyAqZGMsCiAJCXN0cnVjdCBkY19zdGF0ZSAqY29udGV4dCwK
IAkJZGlzcGxheV9lMmVfcGlwZV9wYXJhbXNfc3QgKnBpcGVzLAorCQlpbnQgKnBpcGVfY250X291
dCwKIAkJaW50ICpwaXBlX3NwbGl0X2Zyb20sCiAJCWludCAqdmxldmVsX291dCk7CiB2b2lkIGRj
bjIwX2NhbGN1bGF0ZV9kbGdfcGFyYW1zKAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
