Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2751BC907E
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD1B6E15C;
	Wed,  2 Oct 2019 18:16:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A216E15C
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcjgMrVflevwMRowxnF7RN3WB4Lhh+syvoK0OAEGTO8V4kmF3cgqV/SeWgH9PdeoNAxf1QvcPIJ6DqPTgIDAIollGXZmhuTdY9S82b/NylwO30jN6XgRVdT2inJPoOVxafDKnsGBnbb+ojcZl8lhzS9zZ0mWUXRP2cTgU0mFAjF0DPax85aQ6YePiORZZmOqHrbca7Ae6YBf4Isyx12d9aknErsDU12AXkpm3t7OQKOgoADOsqwBtNczpeL31sHvNT0BzG11bwuY4UUxgk8tPtwhhuH5nVB1fnw5vK+UZQ9LAzas954n1mO5uJ3dcMQlYn/N9ypLgEeAPCa7/j0y6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCJBi+30wfzwvam6y5mzQoZjxGMqUgzVIish2LTcwdU=;
 b=FJbR9csjMS70ZSrcOGOJUH8Gln5UqF5vzMOmBivTvcUJT/Vr5miVWaPH4xcG8+ZYHxqVKi7ZSBMp7nWrYpGGKSyF8Y3AR7lkv3ZXpJx8xZl2KSiYepW2SdGOOECqzYd3tS4ca4wYCtXlA13KmWpY7i+XPgJA1+FFTzJ8cUuoHVm3lMkk7Z0Pjj+aWFto0qMyl3jMOe7xoIaTBz47DTExlnQ1RqwKAlWnW6vQukCWjHYKEhzZMV4MsQ0pBCoFWaiIY8ikIOF9L+5CrfJvgBUckyayHPV4U9MJjIbaBWtOdkhIUaIaEt8I0jgOQaZFqtmJC1/heLRKzNi5ySL6I1Shog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0023.namprd12.prod.outlook.com (2603:10b6:4:1::33) by
 DM5PR12MB1932.namprd12.prod.outlook.com (2603:10b6:3:10e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Wed, 2 Oct 2019 18:16:39 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0023.outlook.office365.com
 (2603:10b6:4:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:38 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:37 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/38] drm/amd/display: Update V_UPDATE whenever VSTARTUP
 changes
Date: Wed, 2 Oct 2019 14:16:00 -0400
Message-ID: <20191002181633.22805-6-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(428003)(199004)(189003)(336012)(81156014)(81166006)(186003)(11346002)(1076003)(2616005)(5660300002)(86362001)(305945005)(446003)(426003)(53416004)(2351001)(50466002)(26005)(4326008)(6666004)(356004)(7696005)(51416003)(8676002)(8936002)(486006)(50226002)(2906002)(14444005)(126002)(6916009)(70206006)(47776003)(316002)(15650500001)(478600001)(16586007)(70586007)(48376002)(476003)(36756003)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1932; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1866ac8b-fc65-4973-d3ae-08d74764ab0e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1932:
X-Microsoft-Antispam-PRVS: <DM5PR12MB19323A1082DAEB0E5045477AF99C0@DM5PR12MB1932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H9vAaO+cnJGQmuSFM4E9lAbsb+mwgt9XKeZLWRDrfh7KduXQkauS2cbR7ue740E53yM6loJ9O3pU4ERIFZi3mhsH86mGBrqC+GHyiTYeniuXrPfI8LAw/Rm6I3kePUblK0n6BfStbAEmLgyyVeqkKYF4RRRCXDMWDGbNXa7Vt+/x2dUNA38pzg5mD6PxLrYSK1dFSo73gj1YU4uvQJZLkdgHDUuF78SNqFtvDbQ3SnVDrPG4VHUuc3CFz7gxWmj7FdKYo872QZjGllJSijojyiXmt3/D62/EqoqGWZuyUMbcg4hz5Ic/Y18dH9P5c/h89J9GnPXEiwzhR9OoVYxF66rC/ADum9yQ9SaKqVT5POa468GWFLJIfGnQ/fw/8eE9Vc0Nf1smQNICmD5jp9nngfENQameg6tQVFHHFADWj6s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:38.7150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1866ac8b-fc65-4973-d3ae-08d74764ab0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCJBi+30wfzwvam6y5mzQoZjxGMqUgzVIish2LTcwdU=;
 b=ssroWeJFMOysGH74ucw0/9Yqcm7kScTAsV5trRUIZjDdhydE5IEQDV5vsLALvTfqDOH37bfaYwtQDJuWHck7f0MRZ99CQUeMeQT4YMWPS6YrEGJASlB1I31tnY8nNFUxRrarl2fH47t9FYK8Z/QSq1Kxck8opwXVZHFUP3Qmu+w=
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
Cc: Aric Cyr <aric.cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+CgpbV2h5XQpJZiBWU1RBUlRVUCBjaGFu
Z2VzIGR1ZSB0byBiYW5kd2lkdGggcmVxdWlyZW1lbnRzLCB3ZSBtdXN0CnJlY2FsY3VsYXRlIGFu
ZCB1cGRhdGUgVkxJTkUyIGFzIHdlbGwgZm9yIHByb3BlciBmbGlwIHJlcG9ydGluZy4KCltIb3dd
CkFmdGVyIGFsbCBjYWxscyB0byBwcm9ncmFtX2dsb2JhbF9zeW5jIHdoaWNoIHJlY29uZmlndXJl
cwpWU1RBUlRVUCwgYWxzbyBtYWtlIHN1cmUgdG8gdXBkYXRlIFZfVVBEQVRFIChpLmUuIFZMSU5F
MiBvbiBEQ054KS4KCkNoYW5nZS1JZDogSWNhMzFmMzQxMGI0YjY1YjNmMzM1NDBjNmZlOTc3YTY5
ZTdhYWYwM2IKU2lnbmVkLW9mZi1ieTogQXJpYyBDeXIgPGFyaWMuY3lyQGFtZC5jb20+ClJldmll
d2VkLWJ5OiBTaXZhcGlyaXlhbiBLdW1hcmFzYW15IDxTaXZhcGlyaXlhbi5LdW1hcmFzYW15QGFt
ZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdf
c2VxdWVuY2VyLmMgfCA0ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9od3NlcS5jICAgICAgICB8IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCmluZGV4IDJmZTI5
NTI2NTMyYy4uMzJiZjZjZjA5Njc3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jCkBAIC0yNTExLDggKzI1
MTEsMTAgQEAgc3RhdGljIHZvaWQgcHJvZ3JhbV9hbGxfcGlwZV9pbl90cmVlKAogCQlwaXBlX2N0
eC0+c3RyZWFtX3Jlcy50Zy0+ZnVuY3MtPnNldF92dGdfcGFyYW1zKAogCQkJCXBpcGVfY3R4LT5z
dHJlYW1fcmVzLnRnLCAmcGlwZV9jdHgtPnN0cmVhbS0+dGltaW5nKTsKIAotCQlkYy0+aHdzcy5i
bGFua19waXhlbF9kYXRhKGRjLCBwaXBlX2N0eCwgYmxhbmspOworCQlpZiAoZGMtPmh3c3Muc2V0
dXBfdnVwZGF0ZV9pbnRlcnJ1cHQpCisJCQlkYy0+aHdzcy5zZXR1cF92dXBkYXRlX2ludGVycnVw
dChwaXBlX2N0eCk7CiAKKwkJZGMtPmh3c3MuYmxhbmtfcGl4ZWxfZGF0YShkYywgcGlwZV9jdHgs
IGJsYW5rKTsKIAl9CiAKIAlpZiAocGlwZV9jdHgtPnBsYW5lX3N0YXRlICE9IE5VTEwpCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCmlu
ZGV4IDg0YWFlOWMwNTc4MS4uMWI0YWFjMTg1ZjNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtMTM3MCw2ICsxMzcwLDkg
QEAgc3RhdGljIHZvaWQgZGNuMjBfcHJvZ3JhbV9waXBlKAogCiAJCXBpcGVfY3R4LT5zdHJlYW1f
cmVzLnRnLT5mdW5jcy0+c2V0X3Z0Z19wYXJhbXMoCiAJCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMu
dGcsICZwaXBlX2N0eC0+c3RyZWFtLT50aW1pbmcpOworCisJCWlmIChkYy0+aHdzcy5zZXR1cF92
dXBkYXRlX2ludGVycnVwdCkKKwkJCWRjLT5od3NzLnNldHVwX3Z1cGRhdGVfaW50ZXJydXB0KHBp
cGVfY3R4KTsKIAl9CiAKIAlpZiAocGlwZV9jdHgtPnVwZGF0ZV9mbGFncy5iaXRzLm9kbSkKQEAg
LTE1ODEsOCArMTU4NCwxMiBAQCBib29sIGRjbjIwX3VwZGF0ZV9iYW5kd2lkdGgoCiAKIAkJCXBp
cGVfY3R4LT5zdHJlYW1fcmVzLnRnLT5mdW5jcy0+c2V0X3Z0Z19wYXJhbXMoCiAJCQkJCXBpcGVf
Y3R4LT5zdHJlYW1fcmVzLnRnLCAmcGlwZV9jdHgtPnN0cmVhbS0+dGltaW5nKTsKKwogCQkJaWYg
KHBpcGVfY3R4LT5wcmV2X29kbV9waXBlID09IE5VTEwpCiAJCQkJZGMtPmh3c3MuYmxhbmtfcGl4
ZWxfZGF0YShkYywgcGlwZV9jdHgsIGJsYW5rKTsKKworCQkJaWYgKGRjLT5od3NzLnNldHVwX3Z1
cGRhdGVfaW50ZXJydXB0KQorCQkJCWRjLT5od3NzLnNldHVwX3Z1cGRhdGVfaW50ZXJydXB0KHBp
cGVfY3R4KTsKIAkJfQogCiAJCXBpcGVfY3R4LT5wbGFuZV9yZXMuaHVicC0+ZnVuY3MtPmh1YnBf
c2V0dXAoCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
