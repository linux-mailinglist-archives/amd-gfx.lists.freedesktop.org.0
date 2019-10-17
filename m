Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6DDB728
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C053A6EA2E;
	Thu, 17 Oct 2019 19:15:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780043.outbound.protection.outlook.com [40.107.78.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CC06EA2E
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kd5Xv8E4p4tYIYbN31EkQZmHdfD/mzPht1w0AMUTQzng1ewSao5Fs66fgMMBMq+z4nvWRgcToGpAHcrt9qL31pZuSWcAuFF0yHL2wuMocuhzkZDwSZ4N3dHZbdQKyPVSbsVRbk2iCpipij6C2l2cfjarjGvrs2qPk9lEFKrexHKLOOvMNCHk94LutSOT9pkj4IsHMsDaAHK8efjYJrHMMfrHnnQEprTUpHd+Hmy8WSPTXe0cUNWJnM0GSNnC1qaT5q92YKA/LiW1Tu0aTSHHwGi8hxIEW5+RhjTPvsbfmPP3pDC0jINipyZRJtND+Okkyfc1wLVRbwT1qMoucqD1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq3jFfaTQp7ftXUNOSlL7tducAsSQaTux/qe3ndcp6s=;
 b=UfhY7JszvnWRqYosoi92MrzZ3RpzAaGcE4ZCZZ56YlRn79H0gKmm0ODla5SgSrS9rbqW+YfTjLgFotD9VelUsBIFqkNM//nbmyXU7VGixqsH9mN74D+Vv1NMpJ68SLGc0UAx5BG2wR1HWkTN2v2HqAxrKg5BE/wG+g/8ezRjQ9nHTNMhXezAKIejt/gMA7zdj++l+PD/YlpYIqUh7vWekUWiMTVyowHwQfDNESQqOqeFlLyBVBbb7odQBwoPkVQ+dKLhvX/hqkr9bnVqHGKaSKBy+1oba28TAjiS4twwtAYlD6ZTk3YzrdUA4+wvJhqmbP9kD/QULzTTlbHqKF8Ejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0069.namprd12.prod.outlook.com (2603:10b6:3:103::31)
 by CH2PR12MB4006.namprd12.prod.outlook.com (2603:10b6:610:25::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Thu, 17 Oct
 2019 19:15:31 +0000
Received: from CO1NAM03FT008.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0069.outlook.office365.com
 (2603:10b6:3:103::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM03FT008.mail.protection.outlook.com (10.152.80.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:29 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:29 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:28 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/37] drm/amd/display: add odm visual confirm
Date: Thu, 17 Oct 2019 15:12:54 -0400
Message-ID: <20191017191329.11857-3-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(428003)(199004)(189003)(356004)(6666004)(2351001)(316002)(2870700001)(70206006)(478600001)(5660300002)(48376002)(6916009)(4326008)(70586007)(54906003)(86362001)(2876002)(1076003)(446003)(26005)(2906002)(8676002)(426003)(486006)(36756003)(14444005)(51416003)(50226002)(11346002)(8936002)(186003)(126002)(47776003)(2616005)(81166006)(81156014)(76176011)(336012)(305945005)(476003)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4006; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e03fc826-1a01-48b8-a316-08d7533660c2
X-MS-TrafficTypeDiagnostic: CH2PR12MB4006:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4006125006B090AF10C03354826D0@CH2PR12MB4006.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ztR2aqWl84leif2jodoLzq+1KD/jMqvYG3XoJKEvJJoNOR8kukj1wWFXl/CYsyJBDtXk1imwc4IGRgL4JWYeh8Nu+R08QOmgO7njpNy9zB0ZE14G0713yUAgDvZcYDmZFNyJBhCAANh4j86ItuVwNqseGbU0iR3N+uMQNKnXz4pinIZtSSrx1tlj/dH2tEfMAfxTqRDHizcwxmBpxodLNiuBrCE89k0QcjoYu4AhGaYtP2n+SBQFCu7mrgxkeHt+uAPPfcQOmJ6Ejd+USrqHiHWvvDP7psx/amUlojThBYgX+wGGWuypGUDEd17LBmwqKz+k+A+lreSGPZD/EHD4tHclWxc3UN7lhdjNV0r20xfPf7Rbld1iNXMuQ0Y0o/Wktuyl57/JGTL5rweojnKYabTOpL+Xxbs+EqQYHgAZOps=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:30.9139 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e03fc826-1a01-48b8-a316-08d7533660c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4006
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq3jFfaTQp7ftXUNOSlL7tducAsSQaTux/qe3ndcp6s=;
 b=xacbaSPGclYRktYmRPZVoA5EAINdGiJrsSGuoWO+TGb4A5Qw584DH/A8E7Y/9jRBRNARUwVWPsAvPKRrY9tVGuXJEIqzcOD2fMhT//mDkH6alDhJ3EPj+YbRocSwvBi5Px2J/FCnwPK35mejeynAcyBQnsNCgWsuF6kOET7vbuY=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KSGFyZCB0byBkZXRlcm1pbmUg
aWYgcGlwZSBjb21iaW5lIGlzIGRvbmUgd2l0aCBNUEMgb3IgT0RNCgpbaG93XQpBZGQgbmV3IHZp
c3VhbCBjb25maXJtIHR5cGUsIHRoaXMgd2lsbCBtYXJrIGVhY2ggTVBDQyB0cmVlCndpdGggYSBk
aWZmZXJlbnQgY29sb3IKClNpZ25lZC1vZmYtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IFlvbmdxaWFuZyBTdW4gPHlvbmdxaWFuZy5zdW5AYW1kLmNvbT4KQWNrZWQt
Ynk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kYy5oICAgICAgICAgICB8ICAxICsKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHdzZXEuYyAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysKIC4uLi9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuaCAgICB8ICA0ICsrLQogMyBmaWxlcyBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGMuaAppbmRleCA1OTY3MTA2ODI2Y2EuLmI3ZTcxODFiYWQ3OCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKQEAgLTIyOSw2ICsyMjksNyBAQCBlbnVtIHZpc3VhbF9j
b25maXJtIHsKIAlWSVNVQUxfQ09ORklSTV9ESVNBQkxFID0gMCwKIAlWSVNVQUxfQ09ORklSTV9T
VVJGQUNFID0gMSwKIAlWSVNVQUxfQ09ORklSTV9IRFIgPSAyLAorCVZJU1VBTF9DT05GSVJNX01Q
Q1RSRUUgPSA0LAogfTsKIAogZW51bSBkY2Nfb3B0aW9uIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggNjIyOWE4Y2EwMDEz
Li5lMjM3ZWMzOWQxOTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9od3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9od3NlcS5jCkBAIC0xOTk2LDYgKzE5OTYsMjggQEAgc3RhdGljIHZvaWQg
ZGNuMjBfcmVzZXRfaHdfY3R4X3dyYXAoCiAJfQogfQogCit2b2lkIGRjbjIwX2dldF9tcGN0cmVl
X3Zpc3VhbF9jb25maXJtX2NvbG9yKAorCQlzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4LAorCQlz
dHJ1Y3QgdGdfY29sb3IgKmNvbG9yKQoreworCWNvbnN0IHN0cnVjdCB0Z19jb2xvciBwaXBlX2Nv
bG9yc1s2XSA9IHsKKwkJCXtNQVhfVEdfQ09MT1JfVkFMVUUsIDAsIDB9LCAvLyByZWQKKwkJCXtN
QVhfVEdfQ09MT1JfVkFMVUUsIDAsIE1BWF9UR19DT0xPUl9WQUxVRX0sIC8vIHllbGxvdworCQkJ
ezAsIE1BWF9UR19DT0xPUl9WQUxVRSwgMH0sIC8vIGJsdWUKKwkJCXtNQVhfVEdfQ09MT1JfVkFM
VUUgLyAyLCAwLCBNQVhfVEdfQ09MT1JfVkFMVUUgLyAyfSwgLy8gcHVycGxlCisJCQl7MCwgMCwg
TUFYX1RHX0NPTE9SX1ZBTFVFfSwgLy8gZ3JlZW4KKwkJCXtNQVhfVEdfQ09MT1JfVkFMVUUsIE1B
WF9UR19DT0xPUl9WQUxVRSAqIDIgLyAzLCAwfSwgLy8gb3JhbmdlCisJfTsKKworCXN0cnVjdCBw
aXBlX2N0eCAqdG9wX3BpcGUgPSBwaXBlX2N0eDsKKworCXdoaWxlICh0b3BfcGlwZS0+dG9wX3Bp
cGUpIHsKKwkJdG9wX3BpcGUgPSB0b3BfcGlwZS0+dG9wX3BpcGU7CisJfQorCisJKmNvbG9yID0g
cGlwZV9jb2xvcnNbdG9wX3BpcGUtPnBpcGVfaWR4XTsKK30KKwogc3RhdGljIHZvaWQgZGNuMjBf
dXBkYXRlX21wY2Moc3RydWN0IGRjICpkYywgc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCkKIHsK
IAlzdHJ1Y3QgaHVicCAqaHVicCA9IHBpcGVfY3R4LT5wbGFuZV9yZXMuaHVicDsKQEAgLTIwMTMs
NiArMjAzNSw5IEBAIHN0YXRpYyB2b2lkIGRjbjIwX3VwZGF0ZV9tcGNjKHN0cnVjdCBkYyAqZGMs
IHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgpCiAJfSBlbHNlIGlmIChkYy0+ZGVidWcudmlzdWFs
X2NvbmZpcm0gPT0gVklTVUFMX0NPTkZJUk1fU1VSRkFDRSkgewogCQlkY24xMF9nZXRfc3VyZmFj
ZV92aXN1YWxfY29uZmlybV9jb2xvcigKIAkJCQlwaXBlX2N0eCwgJmJsbmRfY2ZnLmJsYWNrX2Nv
bG9yKTsKKwl9IGVsc2UgaWYgKGRjLT5kZWJ1Zy52aXN1YWxfY29uZmlybSA9PSBWSVNVQUxfQ09O
RklSTV9NUENUUkVFKSB7CisJCWRjbjIwX2dldF9tcGN0cmVlX3Zpc3VhbF9jb25maXJtX2NvbG9y
KAorCQkJCXBpcGVfY3R4LCAmYmxuZF9jZmcuYmxhY2tfY29sb3IpOwogCX0KIAogCWlmIChwZXJf
cGl4ZWxfYWxwaGEpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMjAvZGNuMjBfaHdzZXEuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9od3NlcS5oCmluZGV4IDlkYmMyZWZmYTRlYS4uMzA5OGYxMDQ5ZWQ3IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuaApA
QCAtMTA5LDUgKzEwOSw3IEBAIGJvb2wgZGNuMjBfc2V0X2JsZW5kX2x1dCgKIAlzdHJ1Y3QgcGlw
ZV9jdHggKnBpcGVfY3R4LCBjb25zdCBzdHJ1Y3QgZGNfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRl
KTsKIGJvb2wgZGNuMjBfc2V0X3NoYXBlcl8zZGx1dCgKIAlzdHJ1Y3QgcGlwZV9jdHggKnBpcGVf
Y3R4LCBjb25zdCBzdHJ1Y3QgZGNfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKTsKLQordm9pZCBk
Y24yMF9nZXRfbXBjdHJlZV92aXN1YWxfY29uZmlybV9jb2xvcigKKwkJc3RydWN0IHBpcGVfY3R4
ICpwaXBlX2N0eCwKKwkJc3RydWN0IHRnX2NvbG9yICpjb2xvcik7CiAjZW5kaWYgLyogX19EQ19I
V1NTX0RDTjIwX0hfXyAqLwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
