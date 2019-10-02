Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFC7C9091
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FC26E97C;
	Wed,  2 Oct 2019 18:16:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3CB6E1A2
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpvrQUMLC/h3GfTpJBePA4S6Tj1bXWoMmySJy1AvkheafKBC33tZsqT8PCRjom6K5few+wKy4TsinK6bX+Oxyu5vwxUfPwz045J8PJoRV+Hsb8+QNdTodh6dkzYfCf9M+fpKPJ2GtrwSRRb5PeY5sdUFwyDc17Ti0hionQaQUdvm9SCGs9RGMdT9ipFdzHxsWZUp6dkkWntiGl5SKPe0d++o/0OliFCPxgXr8aXJZd52XranCiUQyQ3+xiJzNIx7M1wQGKwNcmHte144otSCBGb2C9/kOoTb77Gm9yoT/fHO2GZ5nB0HZ9DyudXYyddQfN5/gc1VXz3quIwXYZeZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4txhtIgkFXlIRCEWmYUruCQi+4wJdOTzg1Ih1BbFRAc=;
 b=oUaSeOyEjYDO3AiCQGxyB2MmC/EElzcv1QgiS4sxYEoc75Aus0fikF8mN7WY+GGrhLTTwgLPenAuw9aaLzE4PqerdtutlG2dXSzBRYzeDhE6gWZnlMX/iKaDE5TCpf5oTPVfyBy+GKm7d4kirePW1pW+slSC/AqzyxXOa+aLDBJHNneRp4x0/LKqfUg+YMbBrYLFLozJbEblokkEc9OJ+zLAZgw9bRC2LRBbr9mqs0oLJCan2daiQXOEO6cBoKcED1qKt011SbDf/rpBDIPJIdm/iRvBYrlGkYZIh0681DnTRPLOdubOU3jIUBXAKiE51GGSC2165G7V6SBeZFdfzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 CY4PR1201MB0038.namprd12.prod.outlook.com (2603:10b6:910:19::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.18; Wed, 2 Oct
 2019 18:16:44 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:44 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:43 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/38] drm/amd/display: Program DWB watermarks from correct
 state
Date: Wed, 2 Oct 2019 14:16:17 -0400
Message-ID: <20191002181633.22805-23-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(428003)(189003)(199004)(478600001)(6916009)(14444005)(8676002)(81156014)(50466002)(356004)(81166006)(8936002)(5660300002)(1076003)(50226002)(47776003)(186003)(51416003)(7696005)(11346002)(36756003)(86362001)(76176011)(26005)(53416004)(2616005)(2906002)(316002)(305945005)(70586007)(4326008)(336012)(2351001)(126002)(476003)(70206006)(486006)(6666004)(426003)(446003)(48376002)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0038; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b12443f0-8220-4374-0777-08d74764ae57
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0038:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00382A9E40771EDD03B83478F99C0@CY4PR1201MB0038.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IuEmNRLlyVaiLFdTJ+MB7CBUEXNnYxDgarTT8fbWDBfq4oixA6/g8qxOUS9PHkxY3H356FlQSUbiVWqBEfrFTl1/SgItPLpUG5sKB6//loErzgVFV78oZVMez7nGV14yVxs4tgBxfLMc4MU5kjnZq4hT20O3LRGnTYhCB1sSbyXHrMMRp9VI2r/wF0GzLfepmkjnicPqQCADjErHmNI4fWIUOnyJ1evxAunsZFxxqYwBqq/J9Su3fhgALQAgHbdEzQS0z61WvSyFsxAkaOX0rI97mwj1fCievro8Bp1WGJUK189h8AlY3YNjzPwl6DsraQqUY17j0/J4MQ3EzFLyw/hwBmHCgOW/b9eBeM9lKl6+PihM7zE7FHlcfQOX7j1cSCDnAUt3ZeIKTxX8skzBwSoq1b4q8ccGn0SAnBb5zWM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:44.2264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b12443f0-8220-4374-0777-08d74764ae57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0038
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4txhtIgkFXlIRCEWmYUruCQi+4wJdOTzg1Ih1BbFRAc=;
 b=qZ3kdSPSr8i0Dg8naivs/N/AS45DpcDAstqwGrtcvR4tM3Mafc6Lg9MxQsymFQyd9MTb5geU1yS4LIxPFb7CoIeKScL7Tw46fErwjF1b+nWMXW3dpB922FIaYN0PNoHCkfP2O/8wnxRARdSaikRqQNbv9JnzA0mWE1y86cyt0LE=
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
Cc: Julian Parkin <julian.parkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVsaWFuIFBhcmtpbiA8anVsaWFuLnBhcmtpbkBhbWQuY29tPgoKW1doeV0KV2hlbiBk
aWFncyBhZGRzIGEgRFdCIHZpYSBhIHN0cmVhbSB1cGRhdGUsIHdlIGNhbGN1bGF0ZSBNTUhVQkJV
QgpwYXJhbWF0ZXJzLCBidXQgZGMtPmN1cnJlbnRfc3RhdGUgaGFzIG5vdCB5ZXQgYmVlbiB1cGRh
dGVkCndoZW4gdGhlIERXQiBwcm9ncmFtbWluZyBoYXBwZW5zLiBUaGlzIGxlYWRzIHRvIG92ZXJm
bG93IG9uCmhpZ2ggYmFuZHdpZHRoIHRlc3RzIHNpbmNlIHRoZSBpbmNvcnJlY3QgTU1IVUJCVUIg
YXJiaXRyYXRpb24KcGFyYW1ldGVycyBhcmUgcHJvZ3JhbW1lZC4KCltIb3ddClBhc3MgdGhlIHVw
ZGF0ZWQgY29udGV4dCBkb3duIHRvIHRoZSAoZW5hYmxlfHVwZGF0ZSlfd3JpdGViYWNrIGZ1bmN0
aW9ucwpzbyB0aGF0IHRoZXkgY2FuIHVzZSB0aGUgY29ycmVjdCB3YXRlcm1hcmtzIHdoZW4gcHJv
Z3JhbW1pbmcgTU1IVUJCVUIuCgpDaGFuZ2UtSWQ6IEkzNmI5ODA1YjE4NmNkY2E4NDE2YTQ0OWQ4
NjZhMDhkYjQyM2M0NGI2ClNpZ25lZC1vZmYtYnk6IEp1bGlhbiBQYXJraW4gPGp1bGlhbi5wYXJr
aW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5
dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQu
TGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9k
Y19zdHJlYW0uYyAgICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX2h3c2VxLmMgfCA1ICsrKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvaW5jL2h3X3NlcXVlbmNlci5oICB8IDYgKysrKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jCmluZGV4IGJmMWQ3YmI5MGUwZi4uYmIwOTI0Mzc1OGZl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJl
YW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0u
YwpAQCAtNDIzLDEwICs0MjMsMTAgQEAgYm9vbCBkY19zdHJlYW1fYWRkX3dyaXRlYmFjayhzdHJ1
Y3QgZGMgKmRjLAogCiAJCWlmIChkd2ItPmZ1bmNzLT5pc19lbmFibGVkKGR3YikpIHsKIAkJCS8q
IHdyaXRlYmFjayBwaXBlIGFscmVhZHkgZW5hYmxlZCwgb25seSBuZWVkIHRvIHVwZGF0ZSAqLwot
CQkJZGMtPmh3c3MudXBkYXRlX3dyaXRlYmFjayhkYywgc3RyZWFtX3N0YXR1cywgd2JfaW5mbyk7
CisJCQlkYy0+aHdzcy51cGRhdGVfd3JpdGViYWNrKGRjLCBzdHJlYW1fc3RhdHVzLCB3Yl9pbmZv
LCBkYy0+Y3VycmVudF9zdGF0ZSk7CiAJCX0gZWxzZSB7CiAJCQkvKiBFbmFibGUgd3JpdGViYWNr
IHBpcGUgZnJvbSBzY3JhdGNoKi8KLQkJCWRjLT5od3NzLmVuYWJsZV93cml0ZWJhY2soZGMsIHN0
cmVhbV9zdGF0dXMsIHdiX2luZm8pOworCQkJZGMtPmh3c3MuZW5hYmxlX3dyaXRlYmFjayhkYywg
c3RyZWFtX3N0YXR1cywgd2JfaW5mbywgZGMtPmN1cnJlbnRfc3RhdGUpOwogCQl9CiAJfQogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdz
ZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5j
CmluZGV4IDRhMDAzODI5MzU2OS4uMmRjZTNlNGI1ZTUxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtMTYyNiw3ICsxNjI2
LDggQEAgYm9vbCBkY24yMF91cGRhdGVfYmFuZHdpZHRoKAogc3RhdGljIHZvaWQgZGNuMjBfZW5h
YmxlX3dyaXRlYmFjaygKIAkJc3RydWN0IGRjICpkYywKIAkJY29uc3Qgc3RydWN0IGRjX3N0cmVh
bV9zdGF0dXMgKnN0cmVhbV9zdGF0dXMsCi0JCXN0cnVjdCBkY193cml0ZWJhY2tfaW5mbyAqd2Jf
aW5mbykKKwkJc3RydWN0IGRjX3dyaXRlYmFja19pbmZvICp3Yl9pbmZvLAorCQlzdHJ1Y3QgZGNf
c3RhdGUgKmNvbnRleHQpCiB7CiAJc3RydWN0IGR3YmMgKmR3YjsKIAlzdHJ1Y3QgbWNpZl93YiAq
bWNpZl93YjsKQEAgLTE2NDMsNyArMTY0NCw3IEBAIHN0YXRpYyB2b2lkIGRjbjIwX2VuYWJsZV93
cml0ZWJhY2soCiAJb3B0Yy0+ZnVuY3MtPnNldF9kd2Jfc291cmNlKG9wdGMsIHdiX2luZm8tPmR3
Yl9waXBlX2luc3QpOwogCS8qIHNldCBNQ0lGX1dCIGJ1ZmZlciBhbmQgYXJiaXRyYXRpb24gY29u
ZmlndXJhdGlvbiAqLwogCW1jaWZfd2ItPmZ1bmNzLT5jb25maWdfbWNpZl9idWYobWNpZl93Yiwg
JndiX2luZm8tPm1jaWZfYnVmX3BhcmFtcywgd2JfaW5mby0+ZHdiX3BhcmFtcy5kZXN0X2hlaWdo
dCk7Ci0JbWNpZl93Yi0+ZnVuY3MtPmNvbmZpZ19tY2lmX2FyYihtY2lmX3diLCAmZGMtPmN1cnJl
bnRfc3RhdGUtPmJ3X2N0eC5idy5kY24uYndfd3JpdGViYWNrLm1jaWZfd2JfYXJiW3diX2luZm8t
PmR3Yl9waXBlX2luc3RdKTsKKwltY2lmX3diLT5mdW5jcy0+Y29uZmlnX21jaWZfYXJiKG1jaWZf
d2IsICZjb250ZXh0LT5id19jdHguYncuZGNuLmJ3X3dyaXRlYmFjay5tY2lmX3diX2FyYlt3Yl9p
bmZvLT5kd2JfcGlwZV9pbnN0XSk7CiAJLyogRW5hYmxlIE1DSUZfV0IgKi8KIAltY2lmX3diLT5m
dW5jcy0+ZW5hYmxlX21jaWYobWNpZl93Yik7CiAJLyogRW5hYmxlIERXQiAqLwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9od19zZXF1ZW5jZXIuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHdfc2VxdWVuY2VyLmgKaW5kZXggZGU5
ZDBhMzEyMTgwLi5lNzc1ZDdhYTA2MmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9pbmMvaHdfc2VxdWVuY2VyLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2luYy9od19zZXF1ZW5jZXIuaApAQCAtMzMxLDEwICszMzEsMTIgQEAgc3RydWN0
IGh3X3NlcXVlbmNlcl9mdW5jcyB7CiAJCQlzdHJ1Y3QgZGNfc3RhdGUgKmNvbnRleHQpOwogCXZv
aWQgKCp1cGRhdGVfd3JpdGViYWNrKShzdHJ1Y3QgZGMgKmRjLAogCQkJY29uc3Qgc3RydWN0IGRj
X3N0cmVhbV9zdGF0dXMgKnN0cmVhbV9zdGF0dXMsCi0JCQlzdHJ1Y3QgZGNfd3JpdGViYWNrX2lu
Zm8gKndiX2luZm8pOworCQkJc3RydWN0IGRjX3dyaXRlYmFja19pbmZvICp3Yl9pbmZvLAorCQkJ
c3RydWN0IGRjX3N0YXRlICpjb250ZXh0KTsKIAl2b2lkICgqZW5hYmxlX3dyaXRlYmFjaykoc3Ry
dWN0IGRjICpkYywKIAkJCWNvbnN0IHN0cnVjdCBkY19zdHJlYW1fc3RhdHVzICpzdHJlYW1fc3Rh
dHVzLAotCQkJc3RydWN0IGRjX3dyaXRlYmFja19pbmZvICp3Yl9pbmZvKTsKKwkJCXN0cnVjdCBk
Y193cml0ZWJhY2tfaW5mbyAqd2JfaW5mbywKKwkJCXN0cnVjdCBkY19zdGF0ZSAqY29udGV4dCk7
CiAJdm9pZCAoKmRpc2FibGVfd3JpdGViYWNrKShzdHJ1Y3QgZGMgKmRjLAogCQkJdW5zaWduZWQg
aW50IGR3Yl9waXBlX2luc3QpOwogI2VuZGlmCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
