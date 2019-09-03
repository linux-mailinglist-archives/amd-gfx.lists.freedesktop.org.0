Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F591A6615
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 11:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACB2897F9;
	Tue,  3 Sep 2019 09:53:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790059.outbound.protection.outlook.com [40.107.79.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B35C897E0
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 09:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEp2oIR5nSm/rBrDjHVWK+hEJnHTH/bwLfnHq0wwPuEsFuagSxEQJVXUZNtC5sBQc76puLafNT3Uk0y65QQzJfmftFJasNd3vkDFrico4uZzFcTlvAyjZtLIy7YpPAlT0uYw5QTukrepaIOkKopE4j7X9z+EtlbAhAl21dSFiICTm4m/Dbuyu76IpqGGM1/uHfchbk2SbeTCpelwyYMLrvjwlXx0CnMa8ph9M7KF3btjiP+4+nxZvZrXFXZtf0ZpOvObQqYw46gz/TC5FVU46951DzxbECHEKecniPg3+OqAjLotEIy9kjDrlQm9uuYKEQwax63NsmPV48Zcwpp23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvAYxwgmYBSPd0b5wWoK24MezpNR0bfRVSPZd0hezN4=;
 b=KMZGTo3qys8xtuxYfEGoTMeBHdnDIuqA4HcwcPjDzjgz1DXl7VJVdewMzWfPjxY2F+B7jx53EACVSyAQQkKszzbL1uMvHLd3FBZHE/kV+VMLfjWWsN0KRQ16AdHQaVQgCvof+YWfOtLKtsra8E5zjYVf4TYq4UwZ3rI60PQI21o8qHVlqyeHUiGfk5L6Lw5ia9SeqMugIxdxaZC8J5RaBKVqQ7ZclacfNIqLFVTk/9LTo9PLFyax2WPfruIbgkpeqqC9Eo5beMcXi2aE55S2wfxzyaJdXxi/mKbtBAFVzlkySVE//jrolYk01PQaXgm9y++OcRkHk7qfwUYoQSOTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0054.namprd12.prod.outlook.com (2603:10b6:3:103::16)
 by SN1PR12MB2592.namprd12.prod.outlook.com (2603:10b6:802:2e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13; Tue, 3 Sep
 2019 09:53:36 +0000
Received: from DM3NAM03FT017.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by DM5PR12CA0054.outlook.office365.com
 (2603:10b6:3:103::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13 via Frontend
 Transport; Tue, 3 Sep 2019 09:53:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT017.mail.protection.outlook.com (10.152.82.201) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 09:53:36 +0000
Received: from ubuntu-mi100.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 3 Sep 2019
 04:53:35 -0500
From: Jack Zhang <Jack.Zhang1@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: add sw_fini interface for df_funcs
Date: Tue, 3 Sep 2019 17:53:31 +0800
Message-ID: <20190903095331.4531-1-Jack.Zhang1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(26005)(486006)(51416003)(8936002)(336012)(36756003)(186003)(7696005)(81166006)(81156014)(2906002)(50466002)(70586007)(6666004)(356004)(50226002)(70206006)(48376002)(8676002)(2616005)(426003)(476003)(126002)(1076003)(86362001)(53416004)(2351001)(53936002)(47776003)(6916009)(16586007)(316002)(5660300002)(478600001)(4326008)(305945005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2592; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6644f97-156b-4394-4392-08d730549707
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN1PR12MB2592; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB2592:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2592B686C39E7305AD8B5855BBB90@SN1PR12MB2592.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01494FA7F7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: xyjNyZkxCVvglLj6ucBvYxMdUYZwFkbOFs8QAm9hsbfGo1L6XIV0TVA5vmNUhV8jM3gyOnJiN9uDaodFQ+7o4Bchhr1FMP7EPRtvMIUeQ5mm41Qa8okppdjoZ1IHdEXz2zftJmlPdQ2boIONckP5vmiRsaBuEU9Y5LGxs/FJSPVwQcl4JFdBP8kAMAsNj2/yJCwgdaJBIAJrHbIlDgfP57Eowvn0Jjapkpr5pvx26Bt6PShGqV8FVVlEqmgjvR+3sUWHsDCam21dCLHrhVKrONX5VMv3dFoAWcBmgrFX7nAOIPeEMyqimhuB4rrgK+QUsh744kaczBLQC9t4N9p5WpCKTGuQg2Xwg/lx3ncayjsyWro4JWoFoHoGv1GPcctY7Au+Wm73YK9YC1pffzPdFj6XsoJSTQU0WouovctTbgg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2019 09:53:36.4475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6644f97-156b-4394-4392-08d730549707
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2592
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvAYxwgmYBSPd0b5wWoK24MezpNR0bfRVSPZd0hezN4=;
 b=fFMG7lejdNYLalAN4y4W51B0AKLwTjnnsIIlzmItVQSGG+D/tf6Q97fjc6VJNhy+5FFAdsHxrliMFoalhAogDy+XeCwaGiq2V+LXz9JcFychDnAQHBpAvwjEpLWIkmTG6sCeF2MDiTGkQZgq5RyIj/GTefV7NgRyrcwF4qvdhFM=
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIHN3X2ZpbmkgaW50ZXJmYWNlIG9mIGRmX2Z1bmNzLgpUaGlzIGludGVyZmFjZSB3aWxsIHJl
bW92ZSBzeXNmcyBmaWxlIG9mIGRmX2NudHJfYXZhaWwKZnVuY3Rpb24uCgpUaGUgb2xkIGJlaGF2
aW9yIG9ubHkgY3JlYXRlIHN5c2ZzIG9mIGRmX2NudHJfYXZhaWwKaW4gc3dfaW5pdCwgYnV0IG5l
dmVyIHJlbW92ZSBpdCBmb3IgbGFjayBvZiBzd19maW5pCmludGVyZmFjZS4gV2l0aCB0aGlzLGRy
aXZlciB3aWxsIHJlcG9ydCBjcmVhdGUKc3lzZnMgZmFpbCB3aGVuIGl0J3MgbG9hZGVkIGZvciB0
aGUgc2Vjb25kIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFpoYW5nIDxKYWNrLlpoYW5nMUBh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICB8IDEgKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFfNy5jIHwgNSArKysrKwogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIHwgOCArKysrKysrKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc29jMTUuYyAgIHwgMyArKysKIDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5o
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKaW5kZXggYTIzNjIxMy4uZjI2
MjI2ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKQEAgLTY1NSw2ICs2NTUsNyBA
QCBzdHJ1Y3QgYW1kZ3B1X21taW9fcmVtYXAgewogCiBzdHJ1Y3QgYW1kZ3B1X2RmX2Z1bmNzIHsK
IAl2b2lkICgqc3dfaW5pdCkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOworCXZvaWQgKCpz
d19maW5pKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAJdm9pZCAoKmVuYWJsZV9icm9h
ZGNhc3RfbW9kZSkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJICAgICAgYm9vbCBl
bmFibGUpOwogCXUzMiAoKmdldF9mYl9jaGFubmVsX251bWJlcikoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFf
Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFfNy5jCmluZGV4IDg0NGMwMzgu
LmQ2MjIxMjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YxXzcu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92MV83LmMKQEAgLTMzLDYgKzMz
LDEwIEBAIHN0YXRpYyB2b2lkIGRmX3YxXzdfc3dfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIHsKIH0KIAorc3RhdGljIHZvaWQgZGZfdjFfN19zd19maW5pKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQoreworfQorCiBzdGF0aWMgdm9pZCBkZl92MV83X2VuYWJsZV9icm9hZGNh
c3RfbW9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZW5hYmxlKQogewpAQCAtMTExLDYgKzExNSw3IEBA
IHN0YXRpYyB2b2lkIGRmX3YxXzdfZW5hYmxlX2VjY19mb3JjZV9wYXJfd3Jfcm13KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2RmX2Z1bmNzIGRmX3Yx
XzdfZnVuY3MgPSB7CiAJLnN3X2luaXQgPSBkZl92MV83X3N3X2luaXQsCisJLnN3X2ZpbmkgPSBk
Zl92MV83X3N3X2ZpbmksCiAJLmVuYWJsZV9icm9hZGNhc3RfbW9kZSA9IGRmX3YxXzdfZW5hYmxl
X2Jyb2FkY2FzdF9tb2RlLAogCS5nZXRfZmJfY2hhbm5lbF9udW1iZXIgPSBkZl92MV83X2dldF9m
Yl9jaGFubmVsX251bWJlciwKIAkuZ2V0X2hibV9jaGFubmVsX251bWJlciA9IGRmX3YxXzdfZ2V0
X2hibV9jaGFubmVsX251bWJlciwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RmX3YzXzYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYwppbmRl
eCBkZWVlNGY0Li4xNmZiZDJiYzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RmX3YzXzYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMK
QEAgLTIyMCw2ICsyMjAsMTMgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9zd19pbml0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogCQlhZGV2LT5kZl9wZXJmbW9uX2NvbmZpZ19hc3NpZ25fbWFz
a1tpXSA9IDA7CiB9CiAKK3N0YXRpYyB2b2lkIGRmX3YzXzZfc3dfZmluaShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKK3sKKworCWRldmljZV9yZW1vdmVfZmlsZShhZGV2LT5kZXYsICZkZXZf
YXR0cl9kZl9jbnRyX2F2YWlsKTsKKworfQorCiBzdGF0aWMgdm9pZCBkZl92M182X2VuYWJsZV9i
cm9hZGNhc3RfbW9kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkJICBib29sIGVu
YWJsZSkKIHsKQEAgLTUzNyw2ICs1NDQsNyBAQCBzdGF0aWMgdm9pZCBkZl92M182X3BtY19nZXRf
Y291bnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIGNvbnN0IHN0cnVjdCBhbWRncHVf
ZGZfZnVuY3MgZGZfdjNfNl9mdW5jcyA9IHsKIAkuc3dfaW5pdCA9IGRmX3YzXzZfc3dfaW5pdCwK
Kwkuc3dfZmluaSA9IGRmX3YzXzZfc3dfZmluaSwKIAkuZW5hYmxlX2Jyb2FkY2FzdF9tb2RlID0g
ZGZfdjNfNl9lbmFibGVfYnJvYWRjYXN0X21vZGUsCiAJLmdldF9mYl9jaGFubmVsX251bWJlciA9
IGRmX3YzXzZfZ2V0X2ZiX2NoYW5uZWxfbnVtYmVyLAogCS5nZXRfaGJtX2NoYW5uZWxfbnVtYmVy
ID0gZGZfdjNfNl9nZXRfaGJtX2NoYW5uZWxfbnVtYmVyLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Nv
YzE1LmMKaW5kZXggZDQwN2UyOS4uY2IyMjk3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2Mx
NS5jCkBAIC0xMjM5LDYgKzEyMzksOSBAQCBzdGF0aWMgaW50IHNvYzE1X2NvbW1vbl9zd19pbml0
KHZvaWQgKmhhbmRsZSkKIAogc3RhdGljIGludCBzb2MxNV9jb21tb25fc3dfZmluaSh2b2lkICpo
YW5kbGUpCiB7CisJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKiloYW5kbGU7CisKKwlhZGV2LT5kZl9mdW5jcy0+c3dfZmluaShhZGV2KTsKIAlyZXR1
cm4gMDsKIH0KIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
