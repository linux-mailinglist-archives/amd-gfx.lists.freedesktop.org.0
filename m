Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA122AEC73
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C9A6E8F4;
	Tue, 10 Sep 2019 13:55:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22E889468
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3vT1YVG1ASg5uP2mDQRG6FP8ymTjOtF8exhKi4inqyYvdmnriEi8Zcnmnatscn8kIdY5LYaa7p9q5BrHJ+dkhb7bltID71QIrDPsTTPYOqqdqKT6fXSmwOdr1rI+M8hNoiwmLbs/cuQ9lJfL27F9+tu9vVXQeGz2JabIMA3Py4l1azvNw4QB+wKOYZwkQESGoWgssFNXmCNaTbPUEpCTIgxTaw/D1JEPKuxUsUEEnJV4IT2xmwzfYZ7zpF5/nYDuz+qwJUIK1YU4RqX3XzzNFDzjPkDPaRFncZRTojiFEEFhU5r9V9/eU5piWrUPAZZvyj4D4Xb1JSd3Dqj5l0cdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4Q1LIycXsHpEJ/vKvvf1TSO2B8Mkgx2uyZKJ/IPQyM=;
 b=gx6MOnYJxzBEez/FDAOc5J7pwpIUyysiSg0Ohj1lCo4HMMHXU5VAfyzZNlg7+VbmBvgMIaqhzY1FTQPcqUIkax9SK1p5Rt3OrzVlHJyWkGVCNqccdEJY10cblBW3SOZAWisvAvAL6iLs5A1uma+CQJaEF+jWY8OHelrLKvjrIZvjUPk+ASHEtud8xYZBsteKWX+uSG8AvC9KP2k7e0SN0X/BaLW5ZATg1Tu81NnvP7e5QFAvkxRsvcsW9bWjb2G0YPu453j2WQchast+6D+nHtOwi/+PpYyy+R33MHX8Xq6UmhlM9kqp2BsgRpOHG+sA3bH7aSgCHMhG4IwuGzxJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0009.namprd12.prod.outlook.com (2603:10b6:5:1c0::22)
 by BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Tue, 10 Sep
 2019 13:55:06 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by DM6PR12CA0009.outlook.office365.com
 (2603:10b6:5:1c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.21 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:05 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:55:00 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/25] drm/amd/display: update odm mode validation to be in
 line with policy
Date: Tue, 10 Sep 2019 09:54:38 -0400
Message-ID: <20190910135445.18300-19-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(50226002)(126002)(5660300002)(2616005)(76176011)(70206006)(6916009)(14444005)(26005)(478600001)(81156014)(186003)(51416003)(4326008)(54906003)(86362001)(8676002)(316002)(8936002)(81166006)(36756003)(2870700001)(53936002)(47776003)(15650500001)(48376002)(50466002)(11346002)(476003)(2351001)(2906002)(336012)(426003)(305945005)(356004)(6666004)(486006)(70586007)(446003)(1076003)(49486002)(2876002)(44824005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4244; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d44808a8-9f6d-4b4a-11cb-08d735f67c44
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BY5PR12MB4244; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB4244:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4244B530517124A49D0ECD6282B60@BY5PR12MB4244.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: boaDRkD7xMOO5ibaFqkknfT75qstuLJhiOpLZ0Xixu4ASdKbOkYHGqMKvr6BSMMUH0Cld82RtXL8Nfp5txAdcIWhClEmvcZyvrABaB7tgLUaoLNdYJHNhHjCBYrYr0viygXVgaov8DqRBWgJnBhV0qoeTafVbh+qUF4D9C6JRRCfW2jcCoftHXrUCVYS2S0NZlYdmFwaViO+Gby+DB41ZfRMGaLkmV+dNS2moMdCKULaR579+uJz5IKiUFY3T2+AyF9fjF7PuloPxzWRtaieMZsvgyq/apzi3ZiMqTT80a61FrOaWE2bYuLSG+XeRgKaN9T3SrU0o5pNiKDlwDzTtg5n145s9uUP81uQsDUKpWVTVsuRKs+OwiaxRgzpP9OVgv/pFl5s4GTlFS+a8dcYOfXhMmfNuEWblg6cLeFR/cg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:05.7455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d44808a8-9f6d-4b4a-11cb-08d735f67c44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4Q1LIycXsHpEJ/vKvvf1TSO2B8Mkgx2uyZKJ/IPQyM=;
 b=UDqqeOvNmpe+QFKjBRfzp8nq1SmM3mUu+vU7xmAR8ujbolM37CmqZnSpwJgBdgEApIYnvv/w7J8D05e/SopMCRqQs+iT2uYeRco04amckCE1MRnssGDcpJUtvY4+lZp71okblFd685+oHLVfeIHjbuqEoquETeMQf4u9qYN6z8U=
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KClBy
ZXZpb3VzbHkgOGszMCB3b3JrZWQgd2l0aCBkc2MgYW5kIG9kbSBjb21iaW5lIGR1ZSB0byBhIHdv
cmthcm91bmQgdGhhdCByYW4KdGhlIGZvcm11bGEgYSBzZWNvbmQgdGltZSB3aXRoIGRzYyBzdXBw
b3J0IGVuYWJsZSBzaG91bGQgZHNjIHZhbGlkYXRpb24gZmFpbC4KVGhpcyB3b3JrZWQgd2hlbiBj
bG9ja3Mgd2VyZSBsb3cgZW5vdWdoIGZvciBmb3JtdWxhIHRvIGVuYWJsZSBvZG0gdG8gbG93ZXIK
dm9sdGFnZSwgaG93ZXZlciBub3cgYnJva2UgZHVlIHRvIGluY3JlYXNlZCBjbG9ja3MuCgpUaGlz
IGNoYW5nZSB1cGRhdGVzIHRoZSBPRE0gY29tYmluZSBwb2xpY3kgd2l0aGluIHRoZSBmb3JtdWxh
IHRvIHByb3Blcmx5CnJlZmxlY3Qgb3VyIGN1cnJlbnQgcG9saWN5IHdpdGhpbiBEQywgb25seSBl
bmFibGluZyBPRE0gd2hlbiB3ZSBoYXZlIHRvLCBhcwp3ZWxsIGFzIGFkZGluZyBhIGNoZWNrIGZv
ciB2aWV3cG9ydCB3aWR0aCB3aGVuIGRzYyBpcyBlbmFibGVkLgoKQXMgYSBzaWRlIGVmZmVjdCB0
aGUgcmVkdW5kYW50IGNhbGwgdG8gZG1sIHdoZW4gb2RtIGlzIHJlcXVpcmVkIGlzIG5vdwp1bm5l
Y2Vzc2FyeS4KClNpZ25lZC1vZmYtYnk6IERteXRybyBMYWt0eXVzaGtpbiA8RG15dHJvLkxha3R5
dXNoa2luQGFtZC5jb20+ClJldmlld2VkLWJ5OiBOaWtvbGEgQ29ybmlqIDxOaWtvbGEuQ29ybmlq
QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiAuLi4v
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAyMiArLS0tLS0tLS0t
LS0tLS0tLS0tCiAuLi4vZGMvZG1sL2RjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjB2Mi5jICAgICAg
fCAgOSArKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMKaW5kZXggZDE5MDFhYjVmYjhjLi44ZDgxYzY1MTU3ZDQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJj
ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNv
dXJjZS5jCkBAIC0yMjQ2LDExICsyMjQ2LDcgQEAgYm9vbCBkY24yMF9mYXN0X3ZhbGlkYXRlX2J3
KAogCWJvb2wgb3V0ID0gZmFsc2U7CiAKIAlpbnQgcGlwZV9jbnQsIGksIHBpcGVfaWR4LCB2bGV2
ZWwsIHZsZXZlbF91bnNwbGl0OwotCWJvb2wgb2RtX2NhcGFibGUgPSBjb250ZXh0LT5id19jdHgu
ZG1sLmlwLm9kbV9jYXBhYmxlOwogCWJvb2wgZm9yY2Vfc3BsaXQgPSBmYWxzZTsKLSNpZmRlZiBD
T05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAotCWJvb2wgZmFpbGVkX25vbl9vZG1fZHNjID0g
ZmFsc2U7Ci0jZW5kaWYKIAlpbnQgc3BsaXRfdGhyZXNob2xkID0gZGMtPnJlc19wb29sLT5waXBl
X2NvdW50IC8gMjsKIAlib29sIGF2b2lkX3NwbGl0ID0gZGMtPmRlYnVnLnBpcGVfc3BsaXRfcG9s
aWN5ICE9IE1QQ19TUExJVF9EWU5BTUlDOwogCkBAIC0yMzI3LDI0ICsyMzIzLDggQEAgYm9vbCBk
Y24yMF9mYXN0X3ZhbGlkYXRlX2J3KAogCQlnb3RvIHZhbGlkYXRlX291dDsKIAl9CiAKLQljb250
ZXh0LT5id19jdHguZG1sLmlwLm9kbV9jYXBhYmxlID0gMDsKLQogCXZsZXZlbCA9IGRtbF9nZXRf
dm9sdGFnZV9sZXZlbCgmY29udGV4dC0+YndfY3R4LmRtbCwgcGlwZXMsIHBpcGVfY250KTsKIAot
CWNvbnRleHQtPmJ3X2N0eC5kbWwuaXAub2RtX2NhcGFibGUgPSBvZG1fY2FwYWJsZTsKLQotI2lm
ZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCi0JLyogMSBkc2MgcGVyIHN0cmVhbSBk
c2MgdmFsaWRhdGlvbiAqLwotCWlmICh2bGV2ZWwgPD0gY29udGV4dC0+YndfY3R4LmRtbC5zb2Mu
bnVtX3N0YXRlcykKLQkJaWYgKCFkY24yMF92YWxpZGF0ZV9kc2MoZGMsIGNvbnRleHQpKSB7Ci0J
CQlmYWlsZWRfbm9uX29kbV9kc2MgPSB0cnVlOwotCQkJdmxldmVsID0gY29udGV4dC0+YndfY3R4
LmRtbC5zb2MubnVtX3N0YXRlcyArIDE7Ci0JCX0KLSNlbmRpZgotCi0JaWYgKHZsZXZlbCA+IGNv
bnRleHQtPmJ3X2N0eC5kbWwuc29jLm51bV9zdGF0ZXMgJiYgb2RtX2NhcGFibGUpCi0JCXZsZXZl
bCA9IGRtbF9nZXRfdm9sdGFnZV9sZXZlbCgmY29udGV4dC0+YndfY3R4LmRtbCwgcGlwZXMsIHBp
cGVfY250KTsKLQogCWlmICh2bGV2ZWwgPiBjb250ZXh0LT5id19jdHguZG1sLnNvYy5udW1fc3Rh
dGVzKQogCQlnb3RvIHZhbGlkYXRlX2ZhaWw7CiAKQEAgLTI0ODAsNyArMjQ2MCw3IEBAIGJvb2wg
ZGNuMjBfZmFzdF92YWxpZGF0ZV9idygKIAl9CiAjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRFND
X1NVUFBPUlQKIAkvKiBBY3R1YWwgZHNjIGNvdW50IHBlciBzdHJlYW0gZHNjIHZhbGlkYXRpb24q
LwotCWlmIChmYWlsZWRfbm9uX29kbV9kc2MgJiYgIWRjbjIwX3ZhbGlkYXRlX2RzYyhkYywgY29u
dGV4dCkpIHsKKwlpZiAoIWRjbjIwX3ZhbGlkYXRlX2RzYyhkYywgY29udGV4dCkpIHsKIAkJY29u
dGV4dC0+YndfY3R4LmRtbC52YmEuVmFsaWRhdGlvblN0YXR1c1tjb250ZXh0LT5id19jdHguZG1s
LnZiYS5zb2MubnVtX3N0YXRlc10gPQogCQkJCURNTF9GQUlMX0RTQ19WQUxJREFUSU9OX0ZBSUxV
UkU7CiAJCWdvdG8gdmFsaWRhdGVfZmFpbDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kbWwvZGNuMjAvZGlzcGxheV9tb2RlX3ZiYV8yMHYyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjB2Mi5j
CmluZGV4IDBmYWZkNjkzZmZiNC4uODQxZWQ2YzIzZjkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIwL2Rpc3BsYXlfbW9kZV92YmFfMjB2Mi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGNuMjAvZGlzcGxheV9tb2Rl
X3ZiYV8yMHYyLmMKQEAgLTM4LDYgKzM4LDcgQEAKIAogI2RlZmluZSBCUFBfSU5WQUxJRCAwCiAj
ZGVmaW5lIEJQUF9CTEVOREVEX1BJUEUgMHhmZmZmZmZmZgorI2RlZmluZSBEQ04yMF9NQVhfRFND
X0lNQUdFX1dJRFRIIDUxODQKIAogc3RhdGljIGRvdWJsZSBhZGp1c3RfUmV0dXJuQlcoCiAJCXN0
cnVjdCBkaXNwbGF5X21vZGVfbGliICptb2RlX2xpYiwKQEAgLTM5MDEsNiArMzkwMiwxMCBAQCB2
b2lkIGRtbDIwdjJfTW9kZVN1cHBvcnRBbmRTeXN0ZW1Db25maWd1cmF0aW9uRnVsbChzdHJ1Y3Qg
ZGlzcGxheV9tb2RlX2xpYiAqbW9kZQogCQkJCW1vZGVfbGliLT52YmEuTWF4aW11bVN3YXRoV2lk
dGhJbkxpbmVCdWZmZXIpOwogCX0KIAlmb3IgKGkgPSAwOyBpIDw9IG1vZGVfbGliLT52YmEuc29j
Lm51bV9zdGF0ZXM7IGkrKykgeworCQlkb3VibGUgTWF4TWF4RGlzcGNsa1JvdW5kZWREb3duID0g
Um91bmRUb0RGU0dyYW51bGFyaXR5RG93bigKKwkJCW1vZGVfbGliLT52YmEuTWF4RGlzcGNsa1tt
b2RlX2xpYi0+dmJhLnNvYy5udW1fc3RhdGVzXSwKKwkJCW1vZGVfbGliLT52YmEuRElTUENMS0RQ
UENMS1ZDT1NwZWVkKTsKKwogCQlmb3IgKGogPSAwOyBqIDwgMjsgaisrKSB7CiAJCQltb2RlX2xp
Yi0+dmJhLk1heERpc3BjbGtSb3VuZGVkRG93blRvREZTR3JhbnVsYXJpdHkgPSBSb3VuZFRvREZT
R3JhbnVsYXJpdHlEb3duKAogCQkJCW1vZGVfbGliLT52YmEuTWF4RGlzcGNsa1tpXSwKQEAgLTM5
MjUsNyArMzkzMCw5IEBAIHZvaWQgZG1sMjB2Ml9Nb2RlU3VwcG9ydEFuZFN5c3RlbUNvbmZpZ3Vy
YXRpb25GdWxsKHN0cnVjdCBkaXNwbGF5X21vZGVfbGliICptb2RlCiAJCQkJCQkmJiBpID09IG1v
ZGVfbGliLT52YmEuc29jLm51bV9zdGF0ZXMpCiAJCQkJCW1vZGVfbGliLT52YmEuUGxhbmVSZXF1
aXJlZERJU1BDTEtXaXRoT0RNQ29tYmluZSA9IG1vZGVfbGliLT52YmEuUGl4ZWxDbG9ja1trXSAv
IDIKIAkJCQkJCQkqICgxICsgbW9kZV9saWItPnZiYS5ESVNQQ0xLRFBQQ0xLRFNDQ0xLRG93blNw
cmVhZGluZyAvIDEwMC4wKTsKLQkJCQlpZiAobW9kZV9saWItPnZiYS5PRE1DYXBhYmlsaXR5ID09
IGZhbHNlIHx8IG1vZGVfbGliLT52YmEuUGxhbmVSZXF1aXJlZERJU1BDTEtXaXRob3V0T0RNQ29t
YmluZSA8PSBtb2RlX2xpYi0+dmJhLk1heERpc3BjbGtSb3VuZGVkRG93blRvREZTR3JhbnVsYXJp
dHkpIHsKKwkJCQlpZiAobW9kZV9saWItPnZiYS5PRE1DYXBhYmlsaXR5ID09IGZhbHNlIHx8CisJ
CQkJCQkobG9jYWxzLT5QbGFuZVJlcXVpcmVkRElTUENMS1dpdGhvdXRPRE1Db21iaW5lIDw9IE1h
eE1heERpc3BjbGtSb3VuZGVkRG93bgorCQkJCQkJCSYmICghbG9jYWxzLT5EU0NFbmFibGVkW2td
IHx8IGxvY2Fscy0+SEFjdGl2ZVtrXSA8PSBEQ04yMF9NQVhfRFNDX0lNQUdFX1dJRFRIKSkpIHsK
IAkJCQkJbG9jYWxzLT5PRE1Db21iaW5lRW5hYmxlUGVyU3RhdGVbaV1ba10gPSBmYWxzZTsKIAkJ
CQkJbW9kZV9saWItPnZiYS5QbGFuZVJlcXVpcmVkRElTUENMSyA9IG1vZGVfbGliLT52YmEuUGxh
bmVSZXF1aXJlZERJU1BDTEtXaXRob3V0T0RNQ29tYmluZTsKIAkJCQl9IGVsc2UgewotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
