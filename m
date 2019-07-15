Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C215F69DD9
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631A289D2F;
	Mon, 15 Jul 2019 21:22:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476C789CDD
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:59 +0000 (UTC)
Received: from DM6PR12CA0033.namprd12.prod.outlook.com (2603:10b6:5:1c0::46)
 by CH2PR12MB3927.namprd12.prod.outlook.com (2603:10b6:610:2d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Mon, 15 Jul
 2019 21:21:57 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM6PR12CA0033.outlook.office365.com
 (2603:10b6:5:1c0::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:56 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:37 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 69/87] drm/amd/display: Implement DAL3 GPU Integer Scaling
Date: Mon, 15 Jul 2019 17:20:31 -0400
Message-ID: <20190715212049.4584-70-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(54906003)(2870700001)(316002)(68736007)(1076003)(6666004)(356004)(86362001)(4326008)(49486002)(48376002)(478600001)(5660300002)(36756003)(50466002)(26005)(6916009)(70586007)(51416003)(186003)(2616005)(126002)(8936002)(486006)(81166006)(11346002)(81156014)(2906002)(426003)(8676002)(76176011)(446003)(476003)(50226002)(336012)(2351001)(47776003)(2876002)(305945005)(53936002)(70206006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3927; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7db7de2a-dea2-465e-780b-08d7096a7772
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3927; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3927:
X-Microsoft-Antispam-PRVS: <CH2PR12MB392710B49F5EA5783627D90D82CF0@CH2PR12MB3927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: i7Y3hhvIkuMeCRhEq3e38A0/DYY2/qjfl0v2wevEAXXmN7ts8/522Ys2Vp/OKQFFBAmhIWWENMyu45KLH35uml3rEAQSry+kWX8HoxA6z5ITvd0gj7FaG2lwPHRwJ8Hexd/5DGu0Ebq8maR56l55Y17DuNY41bqMAO4jP5mS3jugIJAPTMiiW0d0NDLC/7s72gRyW/LxyOfDFlgXuCwITSu0pJpiwBdaDU3hX5czytL3bJjSERczt++kTiVo1a6gyWrr8JZv33r+COrn/5VwoKBOaVkftDs6bH25VTsuzM6vsVijX9LN4VbkWK92/f2k/hzrCiYb7k8vz3GrMRZZcQiM1Nzp6p/x77yKcIW7EkKlErcdpeRiGDIcc7ltPlGH0KguxCo1sA59hVJIJLwplgsZKX7u9XoVgfYlTeNbQsw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:56.9516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db7de2a-dea2-465e-780b-08d7096a7772
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R/RFEj+atEOn2Q2u1CWECQTE1F7t4g40qscV6ngtuw=;
 b=S/KVuChDpzYGo9Flj7EYVlh7upCwRbqnx1tLjuuaC2NXF+1uQvH+Kxbuef0jsJOs3wi9G2IzRHcr1It73Un+8p5ihzpac7DKZ56bKXHrHpXBQBmbdhGbkbyMy1LmnEGlUxKUI6y1dLnWWarmt02P8vjHEo8U40rhYogDQ2MYEag=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Reza Amini <Reza.Amini@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmV6YSBBbWluaSA8UmV6YS5BbWluaUBhbWQuY29tPgoKW1dIWV0KVXNlcnMgd2FudCB0
byBub3QgaGF2ZSBmaWx0ZXJpbmcgd2hlbiBzY2FsaW5nIGJ5IGludGVnZXIKbXVsdGlwbGVzIHRv
IG5hdGl2ZSB0aW1pbmcuCgpbSE9XXQpJZiB0aW1pbmcgaXMgYSBtdWx0aXBsZSBpbnRlZ2VyIG9m
IHZpZXcsIHdlIHNldCBudW1iZXIgb2YgdGFwcwp0byAxIChlZmZlY3Rpdmx5IGNsb3Nlc3QgbmVp
Z2hib3VyKS4KClNpZ25lZC1vZmYtYnk6IFJlemEgQW1pbmkgPFJlemEuQW1pbmlAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExp
IDxzdW5wZW5nLmxpQGFtZC5jb20+CkFja2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFt
ZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5j
ICAgIHwgMTYgKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjX2h3X3R5cGVzLmggICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNf
cmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291
cmNlLmMKaW5kZXggYjU2N2IyMTU5ZjFhLi4zMWE0OWM1OWMyNzggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYwpAQCAtOTM3LDcgKzkz
NywxNCBAQCBzdGF0aWMgdm9pZCBjYWxjdWxhdGVfaW5pdHNfYW5kX2Fkal92cChzdHJ1Y3QgcGlw
ZV9jdHggKnBpcGVfY3R4KQogCWRhdGEtPmluaXRzLnZfY19ib3QgPSBkY19maXhwdF9hZGQoZGF0
YS0+aW5pdHMudl9jLCBkYXRhLT5yYXRpb3MudmVydF9jKTsKIAogfQorc3RhdGljIGJvb2wgYXJl
X3JlY3RfaW50ZWdlcl9tdWx0aXBsZXMoc3RydWN0IHJlY3Qgc3JjLCBzdHJ1Y3QgcmVjdCBkZXN0
KQoreworCWlmIChkZXN0LndpZHRoICA+PSBzcmMud2lkdGggICYmIGRlc3Qud2lkdGggICUgc3Jj
LndpZHRoICA9PSAwICYmCisJCWRlc3QuaGVpZ2h0ID49IHNyYy5oZWlnaHQgJiYgZGVzdC5oZWln
aHQgJSBzcmMuaGVpZ2h0ID09IDApCisJCXJldHVybiB0cnVlOwogCisJcmV0dXJuIGZhbHNlOwor
fQogYm9vbCByZXNvdXJjZV9idWlsZF9zY2FsaW5nX3BhcmFtcyhzdHJ1Y3QgcGlwZV9jdHggKnBp
cGVfY3R4KQogewogCWNvbnN0IHN0cnVjdCBkY19wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUgPSBw
aXBlX2N0eC0+cGxhbmVfc3RhdGU7CkBAIC05ODAsNiArOTg3LDE1IEBAIGJvb2wgcmVzb3VyY2Vf
YnVpbGRfc2NhbGluZ19wYXJhbXMoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCkKIAlpZiAocGlw
ZV9jdHgtPnBsYW5lX3Jlcy5kcHAgIT0gTlVMTCkKIAkJcmVzID0gcGlwZV9jdHgtPnBsYW5lX3Jl
cy5kcHAtPmZ1bmNzLT5kcHBfZ2V0X29wdGltYWxfbnVtYmVyX29mX3RhcHMoCiAJCQkJcGlwZV9j
dHgtPnBsYW5lX3Jlcy5kcHAsICZwaXBlX2N0eC0+cGxhbmVfcmVzLnNjbF9kYXRhLCAmcGxhbmVf
c3RhdGUtPnNjYWxpbmdfcXVhbGl0eSk7CisKKwlpZiAocmVzICYmCisJICAgIHBsYW5lX3N0YXRl
LT5zY2FsaW5nX3F1YWxpdHkuaW50ZWdlcl9zY2FsaW5nICYmCisJICAgIGFyZV9yZWN0X2ludGVn
ZXJfbXVsdGlwbGVzKHBpcGVfY3R4LT5wbGFuZV9yZXMuc2NsX2RhdGEudmlld3BvcnQsCisJCQkJ
ICAgICAgIHBpcGVfY3R4LT5wbGFuZV9yZXMuc2NsX2RhdGEucmVjb3V0KSkgeworCQlwaXBlX2N0
eC0+cGxhbmVfcmVzLnNjbF9kYXRhLnRhcHMudl90YXBzID0gMTsKKwkJcGlwZV9jdHgtPnBsYW5l
X3Jlcy5zY2xfZGF0YS50YXBzLmhfdGFwcyA9IDE7CisJfQorCiAJaWYgKCFyZXMpIHsKIAkJLyog
VHJ5IDI0IGJwcCBsaW5lYnVmZmVyICovCiAJCXBpcGVfY3R4LT5wbGFuZV9yZXMuc2NsX2RhdGEu
bGJfcGFyYW1zLmRlcHRoID0gTEJfUElYRUxfREVQVEhfMjRCUFA7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfaHdfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY19od190eXBlcy5oCmluZGV4IGU5YTYyMjVmNDcyMC4uMjhhMmNk
MmQyYTQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfaHdf
dHlwZXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfaHdfdHlwZXMu
aApAQCAtNjE0LDYgKzYxNCw3IEBAIHN0cnVjdCBzY2FsaW5nX3RhcHMgewogCXVpbnQzMl90IGhf
dGFwczsKIAl1aW50MzJfdCB2X3RhcHNfYzsKIAl1aW50MzJfdCBoX3RhcHNfYzsKKwlib29sIGlu
dGVnZXJfc2NhbGluZzsKIH07CiAKIGVudW0gZGNfdGltaW5nX3N0YW5kYXJkIHsKLS0gCjIuMjIu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
