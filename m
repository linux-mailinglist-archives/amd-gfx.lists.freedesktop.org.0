Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D0B926F8
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3416E169;
	Mon, 19 Aug 2019 14:35:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6687D6E15C
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY4k6rpL28zsbcwz3he6rOeFgCLHdABFLvfSSpOCacNB5QmJAkQc6APzZzaW7D23yjcgtMj8U+91xCQ26ajaR1MO6MtUUOB/GsygtiPqgKFA0BzUKeWWiTopjEL+rXBlIZzsLcN6g+0LV2f8Fp/NeIvY920mZt/TFNGiya1hoW0Aby5+rsnffE59moV3dH2vLnunQmpA2OOc27T+h1xxaCs7CvRlvTdhdF0iw8Yqqv7S49u6tSkORbGONWaxUNMaO+rnqmP7nSy75//gyl4NNxN4PhVJoNs2LQZHXFwjunwEwKl8PBniRypmUYPrUc1Tny2VPjPr0d0qwRIv36u4CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFg2kxZDUtsqvo6uF2isQbTLrNTYiHKqLRZI6xUYvDY=;
 b=PWvFj4uuBn4P+AdH6r+R+VoyzQalrQuzr2TxDi/bAPK7g6Jhrp+g5qANGGdGeQ6uJYqtBT17dmaYlS00FHX6oymcfky9p/ANAvOOO9K+COIejrm/ANxIOTrIPT55SRUnhgqysTzeyk6hNvuFRKPoLBPAMujPE/HbQhXuyF8p0zkRkihcUkofWTOLx9jNjaxLnMvMgAaELp04EbqYRp0MABbn+7TGPlphuZ+YQ5c+a8rFuTkUAjMNrRn9K0zrg07HaOR5BKAjvFAh0aHPBGnDlR2jerSm3kIBpiccH3sgXBmHxN264hXlafSqtTtC8smupJIbjztJlXd2zbeD/KmRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) by
 BYAPR12MB2709.namprd12.prod.outlook.com (2603:10b6:a03:68::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 14:35:54 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0021.outlook.office365.com
 (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:54 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:45 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/36] drm/amd/display: fix trigger not generated for freesync
Date: Mon, 19 Aug 2019 10:34:58 -0400
Message-ID: <20190819143515.21653-20-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(2980300002)(428003)(199004)(189003)(53416004)(16586007)(316002)(4326008)(8676002)(336012)(2351001)(47776003)(50226002)(53936002)(426003)(81156014)(305945005)(8936002)(6916009)(81166006)(5660300002)(70586007)(70206006)(478600001)(1076003)(2906002)(6666004)(356004)(36756003)(486006)(76176011)(26005)(126002)(476003)(2616005)(186003)(51416003)(7696005)(48376002)(86362001)(11346002)(50466002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2709; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76cb6673-0f2c-4b67-a68c-08d724b28aac
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2709; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2709:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2709BE67FCB16F2043CCADD4F9A80@BYAPR12MB2709.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qDuGOUeBi7gXw+EVQOGSbiWrEgwQCmWDgSshVO6qeMery9kqyv+3SAV5XcSavW8lCLF6ixR6z5cvLjymS6z76CnD+lFgKwvvkesoEYUA4jAs41QeCvnx+levX2m2dpMpEJY6Cl7va8+E37khOyqUtAHQ7bZbw5k7en9h0xfDuzElN85Lb3UpfXboy2Mv/7M0O9iprol54grcpEqpHx61aDwFsDUCNawEqAYhwHxFIvcxUjIsLin+QbDVSwa1R9nw/Or72+cKtf3wu8Q6iC/5uWdyjNqMJ2YsRpyDi1iSMzc8HP5sYZwA6IYNxZuDSHdnGpxnYhAElMHyQpff+3iwrpzScFvdFiZAbJazDSMNX396+ve7E7+UmUV2xRkrsGG29/Q9ouLnxKba43V6TYmgvriXL80CTZe0VjPyNcEJQ3k=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:54.3912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cb6673-0f2c-4b67-a68c-08d724b28aac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFg2kxZDUtsqvo6uF2isQbTLrNTYiHKqLRZI6xUYvDY=;
 b=nPXvRMh18XzpcbyGZtlStPB1a/lip6xQsMNensOwby5mNYMTFeIqk5PPrfG4gRg6slMf7OH98BBpKH3E9Cp4U7GhComubWkDwPODGpQfyytbH90zBdkcttdgElTnhf2oLcV7XxkSIONaJEzO5+inZ3QvWUzottU05gZ1dxAqoT4=
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
Cc: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWW9nZXNoIE1vaGFuIE1hcmltdXRodSA8eW9nZXNoLm1vaGFubWFyaW11dGh1QGFtZC5j
b20+CgpbV2h5XQpJbiBuZXdlciBoYXJkd2FyZSBNQU5VQUxfRkxPV19DT05UUk9MIGlzIG5vdCBh
IHRyaWdnZXIgYml0LiBEdWUgdG8gdGhpcwpmcm9udCBwb3JjaCBpcyBmaXhlZCBhbmQgaW4gdGhl
c2UgaGFyZHdhcmUgZnJlZXN5bmMgZG9lcyBub3Qgd29yay4KCltIb3ddCkNoYW5nZSB0aGUgcHJv
Z3JhbW1pbmcgdG8gZ2VuZXJhdGUgYSBwdWxzZSBzbyB0aGF0IHRoZSBldmVudCB3aWxsIGJlCnRy
aWdnZXJlZCwgZnJvbnQgcG9yY2ggd2lsbCBiZSBjdXQgc2hvcnQgYW5kIGZyZWVzeW5jIHdpbGwg
d29yay4KClNpZ25lZC1vZmYtYnk6IFlvZ2VzaCBNb2hhbiBNYXJpbXV0aHUgPHlvZ2VzaC5tb2hh
bm1hcmltdXRodUBhbWQuY29tPgpSZXZpZXdlZC1ieTogQW50aG9ueSBLb28gPEFudGhvbnkuS29v
QGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFA
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBf
b3B0Yy5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3B0Yy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wdGMuYwppbmRleCBl
NWU1YmU2MzAzMmIuLmU5OGU2YmFiNDgwOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wdGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3B0Yy5jCkBAIC04MjUsNiArODI1LDkgQEAgdm9pZCBv
cHRjMV9wcm9ncmFtX21hbnVhbF90cmlnZ2VyKHN0cnVjdCB0aW1pbmdfZ2VuZXJhdG9yICpvcHRj
KQogCiAJUkVHX1NFVChPVEdfTUFOVUFMX0ZMT1dfQ09OVFJPTCwgMCwKIAkJCU1BTlVBTF9GTE9X
X0NPTlRST0wsIDEpOworCisJUkVHX1NFVChPVEdfTUFOVUFMX0ZMT1dfQ09OVFJPTCwgMCwKKwkJ
CU1BTlVBTF9GTE9XX0NPTlRST0wsIDApOwogfQogCiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
