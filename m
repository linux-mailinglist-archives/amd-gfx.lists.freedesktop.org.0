Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B3926ED
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3441A6E15F;
	Mon, 19 Aug 2019 14:35:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B4F6E156
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:35:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EC3QogHDcHkOk+sm74CNqU72rYKDYr+SVOkHp4jPphGWbSO0UyJyHw/b48Jh0hsk9PKL67njo7m3sol7fzrQrCLEjFuHQSfTgR1EH5WAiAa+BsysIa/vKvKsr/O8Q9NsAxJTaKNSdEGT1wGujWo6f+qqzSaXZbQTDMmeoqXmd2lE8YN3Avm6eVPGiJdFcj7xk2NeMGr4Z+Hn/RYmHt9sN4S+cdzxbMwbo3BmRPkfW2Fn8ydh5Sfm8G829j0E2QuaQAIu+anYEifrrVH8ReHnBUapbjBjqK8oy/La94YV3uawTmykggBrLZ/iwkFV/7J8ECsbxyA6M8OFWVKmZ0cHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1l9BIxYwVVajuDd4CYbxuoUSl3UKc51/ngDpei1PQU=;
 b=A3BfPXApIWDkMPUV3qq4WpplzON16hrTecxn/uoKOinr3DKBOvuuTUBzURUajckaTtWZ5FevKpIcmOOfrRbJJgs8WM1Xv3/4Ux0kbBgFxPtkiWP0cEsbu1HGOvP6TjLR+cwhzBTFZulFGPgDejdSuRNILKfsE7lcdu6JsNHYP5Z1I86AbaLJ8iA+MfUqPcoGfJUAlw1id+mZNbz5bQOFO26iYo4Dp1W6rbQXPmrJgoE3xR2kAxV4Uu8a4/4qjqh8g4GZrVDsutogijItLKz3I/IYjM57iJuRkg0O7YVKQJb1GHfdUP4CSQCZ4OOjjxYjcWcckNpRnUDM+vVI/FkJaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) by
 BN6PR12MB1265.namprd12.prod.outlook.com (2603:10b6:404:1d::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 14:35:50 +0000
Received: from BY2NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::202) by DM5PR12CA0021.outlook.office365.com
 (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:35:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT048.mail.protection.outlook.com (10.152.85.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:35:49 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:42 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/36] drm/amd/display: refactor Device ID for external chips
Date: Mon, 19 Aug 2019 10:34:50 -0400
Message-ID: <20190819143515.21653-12-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(428003)(189003)(199004)(48376002)(11346002)(50466002)(186003)(486006)(2906002)(26005)(4326008)(356004)(6666004)(70586007)(70206006)(51416003)(7696005)(53936002)(305945005)(336012)(6916009)(47776003)(16586007)(36756003)(81156014)(8936002)(8676002)(81166006)(316002)(86362001)(50226002)(1076003)(478600001)(5660300002)(2351001)(426003)(76176011)(476003)(2616005)(126002)(53416004)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1265; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f068b6c1-c32d-43a8-c7c8-08d724b287e9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1265; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1265:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1265CFC9E7DAA9C8BDBCC5F7F9A80@BN6PR12MB1265.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: oa9IgWkLmLpDEV0YEgngKTmbIbkjBCfZpY7F2XHegCl2gOgbf2x48xkq/+2Cx2yCuOTlrod1juh0Br/0oyMVs6pnSp3UyMQD0zgqAZWDZiVSkrYiFvygxUUcB/C8UKoMxk2cgznVTjcGWaNoi9GwRqq52V64W/CzcBXI9IZIJ5RWdEelYlKsPDqh7hLYySvcnDZ1frkRnlEPNxdQsVIcpz9Ba7lbMlGmVDmNHuzfYMy0KxmM6PiUULeWGArSa1kJgZ2d0VMBV4SiUZMaq7vx20q2vzufUZMvoidGcnlIycDADZMpocuYX/kjKhv2hSk2wuGZgSCzNn+xQZSpnBSMk3oik20SdnSMo+zXVn1xZJ8ffkShG/hNqceu1eJ2PnlTsOWpCZLS/dtWLSZ+eRXc1Qz4CLJJwEMjwwh2sWYC+hY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:35:49.7607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f068b6c1-c32d-43a8-c7c8-08d724b287e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1265
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1l9BIxYwVVajuDd4CYbxuoUSl3UKc51/ngDpei1PQU=;
 b=um+tKkx/IdC9+NhsA52/EljheZXxdVDpPjZgLI3WUkgyMbQ6eNwFG7b977eNgQ8Ox6T3BbNZevhaMtFcs62O70xwnOkn70CokKNZdW3Y0ykcvZr6gQzgHCkJK0c8f/JpcACyfCjFL18kCdEmXYddNAW5YkNPVXljmkudKz30rmo=
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
Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUWluZ3FpbmcgWmh1byA8cWluZ3Fpbmcuemh1b0BhbWQuY29tPgoKSUVFRSBPVUkgd2ls
bCBub3cgYmUgdXNlZCB3aGlsZSByZWZlcnJpbmcgdG8gY2VydGFpbiB2ZW5kb3JzLgppbnN0ZWFk
IG9mIG5vcm1hbCBpbmRleAoKU2lnbmVkLW9mZi1ieTogUWluZ3FpbmcgWmh1byA8cWluZ3Fpbmcu
emh1b0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVAYW1k
LmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQu
Y29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYyB8
ICAyICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyAgfCAy
MSArKysrKysrKysrKysrKy0tLS0tCiAuLi4vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2Vydmlj
ZV90eXBlcy5oICAgfCAxMCArKysrKy0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9u
cygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGlua19kZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMKaW5kZXggOTQwNjRkOGNlMzAzLi43ZmQyZDEzNThmMWIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtf
ZGRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19k
ZGMuYwpAQCAtMjkyLDcgKzI5Miw3IEBAIHN0YXRpYyB1aW50MzJfdCBkZWZlcl9kZWxheV9jb252
ZXJ0ZXJfd2EoCiB7CiAJc3RydWN0IGRjX2xpbmsgKmxpbmsgPSBkZGMtPmxpbms7CiAKLQlpZiAo
bGluay0+ZHBjZF9jYXBzLmJyYW5jaF9kZXZfaWQgPT0gRFBfQlJBTkNIX0RFVklDRV9JRF80ICYm
CisJaWYgKGxpbmstPmRwY2RfY2Fwcy5icmFuY2hfZGV2X2lkID09IERQX0JSQU5DSF9ERVZJQ0Vf
SURfMDA4MEUxICYmCiAJCSFtZW1jbXAobGluay0+ZHBjZF9jYXBzLmJyYW5jaF9kZXZfbmFtZSwK
IAkJCURQX0RWSV9DT05WRVJURVJfSURfNCwKIAkJCXNpemVvZihsaW5rLT5kcGNkX2NhcHMuYnJh
bmNoX2Rldl9uYW1lKSkpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rX2RwLmMKaW5kZXggMmFhNDRiMjhiNjczLi40MDA2NzQwM2IwNDMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2RwLmMKQEAgLTI2
ODQsMTMgKzI2ODQsMTMgQEAgc3RhdGljIHZvaWQgZHBfd2FfcG93ZXJfdXBfMDAxMEZBKHN0cnVj
dCBkY19saW5rICpsaW5rLCB1aW50OF90ICpkcGNkX2RhdGEsCiAKIAlpZiAobGluay0+ZHBjZF9j
YXBzLmRvbmdsZV90eXBlID09IERJU1BMQVlfRE9OR0xFX0RQX1ZHQV9DT05WRVJURVIpIHsKIAkJ
c3dpdGNoIChsaW5rLT5kcGNkX2NhcHMuYnJhbmNoX2Rldl9pZCkgewotCQkvKiBTb21lIGFjdGl2
ZSBkb25nbGVzIChEUC1WR0EsIERQLURMRFZJIGNvbnZlcnRlcnMpIHBvd2VyIGRvd24KKwkJLyog
MDAxMEZBIGFjdGl2ZSBkb25nbGVzIChEUC1WR0EsIERQLURMRFZJIGNvbnZlcnRlcnMpIHBvd2Vy
IGRvd24KIAkJICogYWxsIGludGVybmFsIGNpcmN1aXRzIGluY2x1ZGluZyBBVVggY29tbXVuaWNh
dGlvbiBwcmV2ZW50aW5nCiAJCSAqIHJlYWRpbmcgRFBDRCB0YWJsZSBhbmQgRURJRCAoc3BlYyB2
aW9sYXRpb24pLgogCQkgKiBFbmNvZGVyIHdpbGwgc2tpcCBEUCBSWCBwb3dlciBkb3duIG9uIGRp
c2FibGVfb3V0cHV0IHRvCiAJCSAqIGtlZXAgcmVjZWl2ZXIgcG93ZXJlZCBhbGwgdGhlIHRpbWUu
Ki8KLQkJY2FzZSBEUF9CUkFOQ0hfREVWSUNFX0lEXzE6Ci0JCWNhc2UgRFBfQlJBTkNIX0RFVklD
RV9JRF80OgorCQljYXNlIERQX0JSQU5DSF9ERVZJQ0VfSURfMDAxMEZBOgorCQljYXNlIERQX0JS
QU5DSF9ERVZJQ0VfSURfMDA4MEUxOgogCQkJbGluay0+d2FfZmxhZ3MuZHBfa2VlcF9yZWNlaXZl
cl9wb3dlcmVkID0gdHJ1ZTsKIAkJCWJyZWFrOwogCkBAIC0zMzk0LDcgKzMzOTQsMTMgQEAgZW51
bSBkcF9wYW5lbF9tb2RlIGRwX2dldF9wYW5lbF9tb2RlKHN0cnVjdCBkY19saW5rICpsaW5rKQog
CWlmIChsaW5rLT5jb25uZWN0b3Jfc2lnbmFsICE9IFNJR05BTF9UWVBFX0RJU1BMQVlfUE9SVCkg
ewogCiAJCXN3aXRjaCAobGluay0+ZHBjZF9jYXBzLmJyYW5jaF9kZXZfaWQpIHsKLQkJY2FzZSBE
UF9CUkFOQ0hfREVWSUNFX0lEXzI6CisJCWNhc2UgRFBfQlJBTkNIX0RFVklDRV9JRF8wMDIyQjk6
CisJCQkvKiBhbHRlcm5hdGUgc2NyYW1ibGVyIHJlc2V0IGlzIHJlcXVpcmVkIGZvciBUcmF2aXMK
KwkJCSAqIGZvciB0aGUgY2FzZSB3aGVuIGV4dGVybmFsIGNoaXAgZG9lcyBub3QKKwkJCSAqIHBy
b3ZpZGUgc2luayBkZXZpY2UgaWQsIGFsdGVybmF0ZSBzY3JhbWJsZXIKKwkJCSAqIHNjaGVtZSB3
aWxsICBiZSBvdmVycmlkZW4gbGF0ZXIgYnkgcXVlcnlpbmcKKwkJCSAqIEVuY29kZXIgZmVhdHVy
ZXMKKwkJCSAqLwogCQkJaWYgKHN0cm5jbXAoCiAJCQkJbGluay0+ZHBjZF9jYXBzLmJyYW5jaF9k
ZXZfbmFtZSwKIAkJCQlEUF9WR0FfTFZEU19DT05WRVJURVJfSURfMiwKQEAgLTM0MDQsNyArMzQx
MCwxMiBAQCBlbnVtIGRwX3BhbmVsX21vZGUgZHBfZ2V0X3BhbmVsX21vZGUoc3RydWN0IGRjX2xp
bmsgKmxpbmspCiAJCQkJCXJldHVybiBEUF9QQU5FTF9NT0RFX1NQRUNJQUw7CiAJCQl9CiAJCQli
cmVhazsKLQkJY2FzZSBEUF9CUkFOQ0hfREVWSUNFX0lEXzM6CisJCWNhc2UgRFBfQlJBTkNIX0RF
VklDRV9JRF8wMDAwMUE6CisJCQkvKiBhbHRlcm5hdGUgc2NyYW1ibGVyIHJlc2V0IGlzIHJlcXVp
cmVkIGZvciBUcmF2aXMKKwkJCSAqIGZvciB0aGUgY2FzZSB3aGVuIGV4dGVybmFsIGNoaXAgZG9l
cyBub3QgcHJvdmlkZQorCQkJICogc2luayBkZXZpY2UgaWQsIGFsdGVybmF0ZSBzY3JhbWJsZXIg
c2NoZW1lIHdpbGwKKwkJCSAqIGJlIG92ZXJyaWRlbiBsYXRlciBieSBxdWVyeWluZyBFbmNvZGVy
IGZlYXR1cmUKKwkJCSAqLwogCQkJaWYgKHN0cm5jbXAobGluay0+ZHBjZF9jYXBzLmJyYW5jaF9k
ZXZfbmFtZSwKIAkJCQlEUF9WR0FfTFZEU19DT05WRVJURVJfSURfMywKIAkJCQlzaXplb2YoCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2Vydmlj
ZV90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZp
Y2VfdHlwZXMuaAppbmRleCBkOTY4OTU2YTEwY2QuLjE4OTYxNzA3ZGIyMyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZpY2VfdHlwZXMuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBl
cy5oCkBAIC0yNSwxMCArMjUsMTIgQEAKICNpZm5kZWYgX19EQUxfRERDX1NFUlZJQ0VfVFlQRVNf
SF9fCiAjZGVmaW5lIF9fREFMX0REQ19TRVJWSUNFX1RZUEVTX0hfXwogCi0jZGVmaW5lIERQX0JS
QU5DSF9ERVZJQ0VfSURfMSAweDAwMTBGQQotI2RlZmluZSBEUF9CUkFOQ0hfREVWSUNFX0lEXzIg
MHgwMDIyQjkKLSNkZWZpbmUgRFBfQlJBTkNIX0RFVklDRV9JRF8zIDB4MDAwMDFBCi0jZGVmaW5l
IERQX0JSQU5DSF9ERVZJQ0VfSURfNCAweDAwODBlMQorLyogMDAxMEZBIGRvbmdsZXMgKFNUIE1p
Y3JvKSBleHRlcm5hbCBjb252ZXJ0ZXIgY2hpcCBpZCAqLworI2RlZmluZSBEUF9CUkFOQ0hfREVW
SUNFX0lEXzAwMTBGQSAweDAwMTBGQQorLyogMDAyMkI5IGV4dGVybmFsIGNvbnZlcnRlciBjaGlw
IGlkICovCisjZGVmaW5lIERQX0JSQU5DSF9ERVZJQ0VfSURfMDAyMkI5IDB4MDAyMkI5CisjZGVm
aW5lIERQX0JSQU5DSF9ERVZJQ0VfSURfMDAwMDFBIDB4MDAwMDFBCisjZGVmaW5lIERQX0JSQU5D
SF9ERVZJQ0VfSURfMDA4MEUxIDB4MDA4MGUxCiAKIGVudW0gZGRjX3Jlc3VsdCB7CiAJRERDX1JF
U1VMVF9VTktOT1dOID0gMCwKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
