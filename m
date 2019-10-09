Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5FD1A95
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2856EA66;
	Wed,  9 Oct 2019 21:06:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3854B6EA67
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNN4JtShRj4BJR8fnBV/emLO7yA4pFzz6Brm38IXvBqUIs/GBj3LjE4Xa/qpXOPNBJITUHXj7nwK1ZgGQ4M2oovyz2h8TVgS64oXviPhUA567vfJTPPsa7b5y7wRJdCR3OH9dsKApfo0YHubwDRFMejiMRXTWOEcMSJriJpcvPi+XQQL1I+5h3EyZ08swUcBjI7OJ52LlQd6e6j6V2bpqvm3u8xWG8RWlNzkOsQ/BTzuX4UXLPNBR15r9IvJP8mUzPmCCDLInxGRuMB4Q81JXNSZF2ei+qTLzkHi78Vj4hcbkMeeYSwodUs0PSQBfnKzQrseRLsxoLEryQYqFDqXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxlZm4VCPHnVhk5u3uiX64ugYWAvzLjTxbgBfplIHSE=;
 b=bvt1iACW7q3JYiM+smHi3KLoX5Fw0MokdeXWSq/6w2tQp1Bcxlrjqqpk/7FOxg2yPf1fsecVEELnfxdh1ZwOLykQsLIlakel8kPI9pozHKm8rzT0sFNClPL4znTRGaRxHL3pSgYKgS+RPhI547h+VHVWJ2jx85XawxP2l7ruIXTFqBoKnks6o8w/ATu6DKLdi5fbn/P+YbbUXwb/5tbE/iQ9kGB60EdWmNe6sQhqdwso3WNvDWlSDke88XWpG5anhRHG5/u6/ze+R23EDejm52Yg8OAWGMiTxUwP7SUNM1PYQCvNKt2Eo7Yg3d0Wot/PKLKXK2Gv1lRodFCCkYH7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by CY4PR12MB1493.namprd12.prod.outlook.com (2603:10b6:910:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.24; Wed, 9 Oct
 2019 21:06:29 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:28 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:28 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/26] drm/amd/display: update odm mode validation to be in
 line with policy
Date: Wed, 9 Oct 2019 17:06:07 -0400
Message-ID: <20191009210613.17929-21-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(428003)(199004)(189003)(186003)(54906003)(4326008)(8936002)(14444005)(16586007)(316002)(76176011)(70586007)(70206006)(486006)(6916009)(36756003)(478600001)(50466002)(26005)(86362001)(50226002)(81156014)(126002)(5660300002)(6666004)(476003)(7696005)(11346002)(356004)(81166006)(2906002)(47776003)(8676002)(51416003)(48376002)(446003)(336012)(1076003)(305945005)(15650500001)(53416004)(426003)(2616005)(2351001)(44824005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1493; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49adac97-d04b-4012-bdbe-08d74cfc8df3
X-MS-TrafficTypeDiagnostic: CY4PR12MB1493:
X-Microsoft-Antispam-PRVS: <CY4PR12MB14935E3676D6F1E546E36DD8F9950@CY4PR12MB1493.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fhin+8aFIKEvtU0/WS/ItgiZ7wHmQKbZLl0WSju6z0xaL+d9WlYiuduT6V37gfjiLkp+KEezQUSJqbOexQIzheS0Gf4X5VmxwKjfaFGBk+DMV5VbwJoOezkeaLQKvGPmGBWnbCEMdlPSu/N02NLta3y1Z3fsHMZwndaemRBREPHdt+JK4Hxfy7JXx8MwaamUJBt/k9cFz2ht6WFA7cwNnsCcHOLZ4CN+NVWvVou9YLs9+PnGHP+xJ9JxQzOh2WtiVys3GNT79j4TbjLZ5CEvS8u6muKLTjjD/OM1oDDULruCRWEMittPVXdeuVt0I3D37UqfEUNf5p6Mk0RHINIIiqMtoVGIHh6W4Vt+Lq3HYGT131zaiHvh3gdQFh+pgfL60v9uSgJk5zDmCArdf13XUHocvfPySMsOi7zJtjbjCYw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:28.8521 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49adac97-d04b-4012-bdbe-08d74cfc8df3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1493
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxlZm4VCPHnVhk5u3uiX64ugYWAvzLjTxbgBfplIHSE=;
 b=x4Cc3+HGyjUvY9eaKESbzNruVY3xtnM/7lTNIrdF1ArNGPdpto7cJWh1Fkr0PcUPA6gKbnlqu9pK0hhVB8WDa3MRqVA7zFNBcdk500ChJTG2+8nh7UJ1yS6IqU3BQqYkvRZ4O6Lb5GqCP6jxHCrhrDFWs3Eg+G3yPNaw2ez+g8s=
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
Cc: sunpeng.li@amd.com, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 harry.wentland@amd.com
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
dXNoa2luQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQu
TGFraGFAYW1kLmNvbT4KLS0tCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMS9kaXNw
bGF5X21vZGVfdmJhXzIxLmMgICB8IDkgKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RtbC9kY24yMS9kaXNwbGF5X21vZGVfdmJhXzIxLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEuYwppbmRl
eCAzYjZlZDYwZGNkMzUuLmZkNzA3ZTc0NTliNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMS9kaXNwbGF5X21vZGVfdmJhXzIxLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtbC9kY24yMS9kaXNwbGF5X21vZGVfdmJhXzIx
LmMKQEAgLTY1LDYgKzY1LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgewogCiAjZGVmaW5lIEJQUF9JTlZB
TElEIDAKICNkZWZpbmUgQlBQX0JMRU5ERURfUElQRSAweGZmZmZmZmZmCisjZGVmaW5lIERDTjIx
X01BWF9EU0NfSU1BR0VfV0lEVEggNTE4NAogCiBzdGF0aWMgdm9pZCBEaXNwbGF5UGlwZUNvbmZp
Z3VyYXRpb24oc3RydWN0IGRpc3BsYXlfbW9kZV9saWIgKm1vZGVfbGliKTsKIHN0YXRpYyB2b2lk
IERJU1BDTEtEUFBDTEtEQ0ZDTEtEZWVwU2xlZXBQcmVmZXRjaFBhcmFtZXRlcnNXYXRlcm1hcmtz
QW5kUGVyZm9ybWFuY2VDYWxjdWxhdGlvbigKQEAgLTM5MzYsNiArMzkzNywxMCBAQCB2b2lkIGRt
bDIxX01vZGVTdXBwb3J0QW5kU3lzdGVtQ29uZmlndXJhdGlvbkZ1bGwoc3RydWN0IGRpc3BsYXlf
bW9kZV9saWIgKm1vZGVfbAogCQkJCW1vZGVfbGliLT52YmEuTWF4aW11bVN3YXRoV2lkdGhJbkxp
bmVCdWZmZXIpOwogCX0KIAlmb3IgKGkgPSAwOyBpIDw9IG1vZGVfbGliLT52YmEuc29jLm51bV9z
dGF0ZXM7IGkrKykgeworCQlkb3VibGUgTWF4TWF4RGlzcGNsa1JvdW5kZWREb3duID0gUm91bmRU
b0RGU0dyYW51bGFyaXR5RG93bigKKwkJCW1vZGVfbGliLT52YmEuTWF4RGlzcGNsa1ttb2RlX2xp
Yi0+dmJhLnNvYy5udW1fc3RhdGVzXSwKKwkJCW1vZGVfbGliLT52YmEuRElTUENMS0RQUENMS1ZD
T1NwZWVkKTsKKwogCQlmb3IgKGogPSAwOyBqIDwgMjsgaisrKSB7CiAJCQltb2RlX2xpYi0+dmJh
Lk1heERpc3BjbGtSb3VuZGVkRG93blRvREZTR3JhbnVsYXJpdHkgPSBSb3VuZFRvREZTR3JhbnVs
YXJpdHlEb3duKAogCQkJCW1vZGVfbGliLT52YmEuTWF4RGlzcGNsa1tpXSwKQEAgLTM5NjUsNyAr
Mzk3MCw5IEBAIHZvaWQgZG1sMjFfTW9kZVN1cHBvcnRBbmRTeXN0ZW1Db25maWd1cmF0aW9uRnVs
bChzdHJ1Y3QgZGlzcGxheV9tb2RlX2xpYiAqbW9kZV9sCiAJCQkJCQkmJiBpID09IG1vZGVfbGli
LT52YmEuc29jLm51bV9zdGF0ZXMpCiAJCQkJCW1vZGVfbGliLT52YmEuUGxhbmVSZXF1aXJlZERJ
U1BDTEtXaXRoT0RNQ29tYmluZSA9IG1vZGVfbGliLT52YmEuUGl4ZWxDbG9ja1trXSAvIDIKIAkJ
CQkJCQkqICgxICsgbW9kZV9saWItPnZiYS5ESVNQQ0xLRFBQQ0xLRFNDQ0xLRG93blNwcmVhZGlu
ZyAvIDEwMC4wKTsKLQkJCQlpZiAobW9kZV9saWItPnZiYS5PRE1DYXBhYmlsaXR5ID09IGZhbHNl
IHx8IG1vZGVfbGliLT52YmEuUGxhbmVSZXF1aXJlZERJU1BDTEtXaXRob3V0T0RNQ29tYmluZSA8
PSBtb2RlX2xpYi0+dmJhLk1heERpc3BjbGtSb3VuZGVkRG93blRvREZTR3JhbnVsYXJpdHkpIHsK
KwkJCQlpZiAobW9kZV9saWItPnZiYS5PRE1DYXBhYmlsaXR5ID09IGZhbHNlIHx8CisJCQkJCQko
bG9jYWxzLT5QbGFuZVJlcXVpcmVkRElTUENMS1dpdGhvdXRPRE1Db21iaW5lIDw9IE1heE1heERp
c3BjbGtSb3VuZGVkRG93bgorCQkJCQkJCSYmICghbG9jYWxzLT5EU0NFbmFibGVkW2tdIHx8IGxv
Y2Fscy0+SEFjdGl2ZVtrXSA8PSBEQ04yMV9NQVhfRFNDX0lNQUdFX1dJRFRIKSkpIHsKIAkJCQkJ
bG9jYWxzLT5PRE1Db21iaW5lRW5hYmxlUGVyU3RhdGVbaV1ba10gPSBmYWxzZTsKIAkJCQkJbW9k
ZV9saWItPnZiYS5QbGFuZVJlcXVpcmVkRElTUENMSyA9IG1vZGVfbGliLT52YmEuUGxhbmVSZXF1
aXJlZERJU1BDTEtXaXRob3V0T0RNQ29tYmluZTsKIAkJCQl9IGVsc2UgewotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
