Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A96C9092
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D506E196;
	Wed,  2 Oct 2019 18:16:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059306E97B
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIVd6IpI0LXMkMlufnBLFmvK1TCdynAU2G/sGiEQAV8AOZbz1bfQwGIBJas0KfQOeDh03LpsB/JewcU7Fwl9qVkx2vHT7mBwOQAo6sRBv1AGKJE+00NWlQnAYlkPXKQPa1Zkaw3xjEiAWWKwypFttQZK+CcqIft4ctuYwiFOjmfDzAn9IXBZ6XnBwCERNApYpzWrD9rfx5KWZOjp8ZQH+Y/h/003x1UQeKQk4yq/hbY1a1FW+O50o2WRRcCr8qcV81T6VgPJneDw6sP8OLtV2WmW/CJY0F+OHmMARlbE/z9TNLedcpu8Ztjf/3yDY6DWZ+i1Fn4WH6NFY5tXY0zuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVX+K821ma/CeI/c0ecncXV7f28r9/MU7o+HOBDOOGs=;
 b=j9Kd1Afw39KgjU5LZ6rGI0p4pNICXk+GPzxUR+EmPRzp9+oSwZie5CAVRA0eNO8dHqCalF3CJDw/VdxTv5uNnd78Z9KoYFsFjrtuE7UZK3gq5CRkU85JTANd614hCoGns0P9KXHq6/JmWy17k0pYAw91eQIOjQ3hX6pu52yRG4VuYdmmRhpDJRnxFejYmGMSyVD4UyGZzidv6DOWvPLwrmGPzl88m035CwS07XVNT6RnxmLqPk2qCyeKM331+sGaODD5upTEVS3EBLB7oczRqvIeqKnIltJAvXcWQT7wRCzatUCZbn0cT8MVHlK87KP16xMDfC3OVwMvQWfAE9raqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0002.namprd12.prod.outlook.com (2603:10b6:4:1::12) by
 BN8PR12MB3410.namprd12.prod.outlook.com (2603:10b6:408:45::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Wed, 2 Oct 2019 18:16:49 +0000
Received: from DM3NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM5PR12CA0002.outlook.office365.com
 (2603:10b6:4:1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:49 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT005.mail.protection.outlook.com (10.152.82.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:49 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:47 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 30/38] drm/amd/display: use vbios message to call smu for dpm
 level
Date: Wed, 2 Oct 2019 14:16:25 -0400
Message-ID: <20191002181633.22805-31-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(428003)(199004)(189003)(36756003)(4326008)(8936002)(50226002)(8676002)(81156014)(81166006)(86362001)(47776003)(14444005)(6666004)(486006)(126002)(2616005)(476003)(51416003)(11346002)(336012)(426003)(305945005)(48376002)(186003)(2906002)(7696005)(356004)(446003)(26005)(15650500001)(16586007)(316002)(478600001)(70206006)(70586007)(6916009)(1076003)(5660300002)(2351001)(53416004)(50466002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3410; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 007e19c5-0c92-4028-ed89-08d74764b19c
X-MS-TrafficTypeDiagnostic: BN8PR12MB3410:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3410373449AE17F232B9467DF99C0@BN8PR12MB3410.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kp90ybk4MkqsfzuI8xNXgv7Zu+hWHbjZch+7OGjfJaraXGJT9UFa5tTRs2iXWa81zRNS70FZjv/0Q7q7R3oaxeLYF7OOQ+FmGF0b3zOqR7725767cgiFjpnMboyLgoFSTVOYYvOlSadPLe1jo81o0+hYYJ81IdP50infWels8T1xBu4G6eJLbLjMr9/0v4tdLdrqJGP3NDEJKSK2eC8MdvqdfOBba+ytO+TpFJRb6xLCionu3Agxfxap9YvtIPfIGrkkMITmypA8rMhBtHQwaoQFf2XfLBtaG08mt8tpGa6VbY6mBqhqoB4sejFASvN17DBSMh47W6I0XSM4xz+SQCQD7yoiymujYg4qmUEm+5E3DEhQz6NJkjrJKm0NILRFXbuGkOWnQ37uPJ6biqoGGLEEM99rVklMFmOdCE1dSzA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:49.7086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 007e19c5-0c92-4028-ed89-08d74764b19c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVX+K821ma/CeI/c0ecncXV7f28r9/MU7o+HOBDOOGs=;
 b=kw/pdv2wDUGM3zoYoCAqh4q84mscmHX2/sR36d7vClyhNl7fbw5WN2mRR+lH2hYCo36DQ+041fCiuPWTmcls90qkDGM2HpuCfXdzxq8kX4CyJ21FtpPJHPTgqms/7hF4MhrVyk63mj1+z/KC9YL29ZMDgyYdO4fFJbB51b41pDU=
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
Cc: Charlene Liu <charlene.liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hhcmxlbmUgTGl1IDxjaGFybGVuZS5saXVAYW1kLmNvbT4KCltEZXNjcmlwdGlvbl0K
dXNlIHZiaW9zIG1lc3NhZ2UgdG8gY2FsbCBzbXUgZm9yIGRwbSBsZXZlbAphbHNvIG9ubHkgcHJv
Z3JhbSBkbWRhdGEgaW4gdnN5bmNmbGlwIGFzIEhXIHJlcXVpcmVtZW50LgoKQ2hhbmdlLUlkOiBJ
YWFkMDBkYjFhNWY4ZTIwM2I3MDhkMjYwNWZmMTZlOGIzYjMyM2IyYgpTaWduZWQtb2ZmLWJ5OiBD
aGFybGVuZSBMaXUgPGNoYXJsZW5lLmxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExh
a3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnBy
ZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9hbWQvZGlzcGxh
eS9kYy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuaCAgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCAgICAgICAgICAgICAgIHwgIDggKysrKysrKysKIC4uLi9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgICAgfCAgNiArKysrLS0K
IC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2Nsa19tZ3JfaW50ZXJuYWwuaCAgfCAxNSAr
KysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xr
X21nci9kY24yMC9kY24yMF9jbGtfbWdyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmgKaW5kZXggYWMzMWE5Nzg3MzA1Li5jOWZk
ODI0ZjNjMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtf
bWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmgKQEAgLTUwLDQgKzUwLDUgQEAgdm9p
ZCBkY24yX2dldF9jbG9jayhzdHJ1Y3QgY2xrX21nciAqY2xrX21nciwKIAkJCWVudW0gZGNfY2xv
Y2tfdHlwZSBjbG9ja190eXBlLAogCQkJc3RydWN0IGRjX2Nsb2NrX2NvbmZpZyAqY2xvY2tfY2Zn
KTsKIAordm9pZCBkY24yMF91cGRhdGVfY2xvY2tzX3VwZGF0ZV9kZW50aXN0KHN0cnVjdCBjbGtf
bWdyX2ludGVybmFsICpjbGtfbWdyKTsKICNlbmRpZiAvL19fRENOMjBfQ0xLX01HUl9IX18KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmgKaW5kZXggNmM1MGQ1YzI0NjU4Li5jMDRhMWY0MGUw
YmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kYy5oCkBAIC0yNDUsNiArMjQ1LDEzIEBA
IGVudW0gd21fcmVwb3J0X21vZGUgewogCVdNX1JFUE9SVF9ERUZBVUxUID0gMCwKIAlXTV9SRVBP
UlRfT1ZFUlJJREUgPSAxLAogfTsKK2VudW0gZHRtX3BzdGF0ZXsKKwlkdG1fbGV2ZWxfcDAgPSAw
LC8qaGlnaGVzdCB2b2x0YWdlKi8KKwlkdG1fbGV2ZWxfcDEsCisJZHRtX2xldmVsX3AyLAorCWR0
bV9sZXZlbF9wMywKKwlkdG1fbGV2ZWxfcDQsLyp3aGVuIGFjdGl2ZV9kaXNwbGF5X2NvdW50ID0g
MCovCit9OwogCiBlbnVtIGRjbl9wd3Jfc3RhdGUgewogCURDTl9QV1JfU1RBVEVfT1BUSU1JWkVE
ID0gMCwKQEAgLTI3MSw2ICsyNzgsNyBAQCBzdHJ1Y3QgZGNfY2xvY2tzIHsKIAkgKiBvcHRpbWl6
YXRpb24gcmVxdWlyZWQKIAkgKi8KIAlib29sIHByZXZfcF9zdGF0ZV9jaGFuZ2Vfc3VwcG9ydDsK
KwllbnVtIGR0bV9wc3RhdGUgZHRtX2xldmVsOwogCWludCBtYXhfc3VwcG9ydGVkX2RwcGNsa19r
aHo7CiAJaW50IG1heF9zdXBwb3J0ZWRfZGlzcGNsa19raHo7CiAJaW50IGJ3X2RwcGNsa19raHo7
IC8qYSBjb3B5IG9mIGRwcGNsa19raHoqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwppbmRleCAyZGNlM2U0YjVlNTEuLmNlMjUzMDUw
OWUxMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX2h3c2VxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX2h3c2VxLmMKQEAgLTIyMDksOCArMjIwOSwxMCBAQCBzdGF0aWMgdm9pZCBkY24yMF9lbmFi
bGVfc3RyZWFtKHN0cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgpCiAJbGluay0+bGlua19lbmMtPmZ1
bmNzLT5jb25uZWN0X2RpZ19iZV90b19mZShsaW5rLT5saW5rX2VuYywKIAkJCQkJCSAgICBwaXBl
X2N0eC0+c3RyZWFtX3Jlcy5zdHJlYW1fZW5jLT5pZCwgdHJ1ZSk7CiAKLQlpZiAobGluay0+ZGMt
Pmh3c3MucHJvZ3JhbV9kbWRhdGFfZW5naW5lKQotCQlsaW5rLT5kYy0+aHdzcy5wcm9ncmFtX2Rt
ZGF0YV9lbmdpbmUocGlwZV9jdHgpOworCWlmIChwaXBlX2N0eC0+cGxhbmVfc3RhdGUgJiYgcGlw
ZV9jdHgtPnBsYW5lX3N0YXRlLT5mbGlwX2ltbWVkaWF0ZSAhPSAxKSB7CisJCWlmIChsaW5rLT5k
Yy0+aHdzcy5wcm9ncmFtX2RtZGF0YV9lbmdpbmUpCisJCQlsaW5rLT5kYy0+aHdzcy5wcm9ncmFt
X2RtZGF0YV9lbmdpbmUocGlwZV9jdHgpOworCX0KIAogCWxpbmstPmRjLT5od3NzLnVwZGF0ZV9p
bmZvX2ZyYW1lKHBpcGVfY3R4KTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvaW5jL2h3L2Nsa19tZ3JfaW50ZXJuYWwuaAppbmRleCA3ZGQ0NmViOTZkNjcu
LjJlOGNkNzk1NmExNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2luYy9ody9jbGtfbWdyX2ludGVybmFsLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2luYy9ody9jbGtfbWdyX2ludGVybmFsLmgKQEAgLTE4NCw2ICsxODQsMjEgQEAgc3Ry
dWN0IGNsa19tZ3JfcmVnaXN0ZXJzIHsKIAl1aW50MzJfdCBNUDFfU01OX0MyUE1TR185MTsKIH07
CiAKK2VudW0gY2xvY2tfdHlwZSB7CisJY2xvY2tfdHlwZV9kaXNwY2xrID0gMSwKKwljbG9ja190
eXBlX2RjZmNsaywKKwljbG9ja190eXBlX3NvY2NsaywKKwljbG9ja190eXBlX3BpeGVsY2xrLAor
CWNsb2NrX3R5cGVfcGh5Y2xrLAorCWNsb2NrX3R5cGVfZHBwY2xrLAorCWNsb2NrX3R5cGVfZmNs
aywKKwljbG9ja190eXBlX2RjZmRzY2xrLAorCWNsb2NrX3R5cGVfZHNjY2xrLAorCWNsb2NrX3R5
cGVfdWNsaywKKwljbG9ja190eXBlX2RyYW1jbGssCit9OworCisKIHN0cnVjdCBzdGF0ZV9kZXBl
bmRlbnRfY2xvY2tzIHsKIAlpbnQgZGlzcGxheV9jbGtfa2h6OwogCWludCBwaXhlbF9jbGtfa2h6
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
