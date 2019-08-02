Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2F97FD1C
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 17:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECB76EEA8;
	Fri,  2 Aug 2019 15:12:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780053.outbound.protection.outlook.com [40.107.78.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987806EEA8
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 15:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yb0xDEAwJwLB5aeK6jGRVp4wpBzyi72Lj2d4hJVv2nThRRzghHrR9NdpQTMas40yYwIKvF3Rggsuq84cCemdMfcwdCDrszBHK2+JV1eA9F/iWiUQEh/89f36inIGHQkXJGISEWc8xZda3h9GHzQf6f4CYyl1RLzipinamZEbZHWd83vpkTrqDBHZQqiidUqfMPvUQI4uFOxG4bz4wXAS7zgDfioCrIYfHjcINbmftv4JozsyivBzAr39/+HvsacArz/X/+WRaf1FdGw2AcMRa/8hh9af1ftdXYg+c8DYKTW3pNRyPuyWh3joUloGRxTeJ0vimrdMK88g8vnPSQUwjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZVicyugus6plAWExAsZLGBnyLhYsQdxb5PdF92cd3k=;
 b=iS3ofSOhdhfHP1+IEKaEs2JvHKtwRCeZshnkvHjdXBFf3E1mbaHh+1R6Aee7tT/VUOtETIvvyhtqgyiwUPiGdYguLcIxQAJ25ZR3RdAr330OBdTqhQ1NxPr7L5S6NOMsG2TPyB7h+Q4aKK2uAJqvj/7sWS8UXNxTfelUucJDVkQ6cBUzftd1qXuzI+2qcVky/PAEtHzsGQ9Jg/gGDNiSK9rQEXJF1uy6WI9Bxk+74ZGzsfP7S6vpZKDM5cpV00n4573uu640p4y5A+l5h7w0mwtzaBHfMh29InC8Cfo9Czc1gqhCAuVEVyw5NO5rPZSWiPwOitqmYDn2F572F2aHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CH2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:610:57::13)
 by BN8PR12MB3473.namprd12.prod.outlook.com (2603:10b6:408:46::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16; Fri, 2 Aug
 2019 15:11:57 +0000
Received: from BY2NAM03FT015.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by CH2PR12CA0003.outlook.office365.com
 (2603:10b6:610:57::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.12 via Frontend
 Transport; Fri, 2 Aug 2019 15:11:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT015.mail.protection.outlook.com (10.152.84.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Fri, 2 Aug 2019 15:11:56 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 2 Aug 2019
 10:11:56 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: Block immediate flips for non-fast
 updates
Date: Fri, 2 Aug 2019 11:11:50 -0400
Message-ID: <20190802151150.26628-2-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190802151150.26628-1-nicholas.kazlauskas@amd.com>
References: <20190802151150.26628-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(336012)(2351001)(53936002)(86362001)(76176011)(7696005)(51416003)(2906002)(4326008)(70586007)(6916009)(26005)(47776003)(14444005)(1076003)(44832011)(5660300002)(53416004)(81166006)(68736007)(186003)(81156014)(50226002)(50466002)(70206006)(48376002)(8676002)(126002)(36756003)(478600001)(316002)(15650500001)(486006)(16586007)(2616005)(446003)(8936002)(356004)(6666004)(11346002)(54906003)(476003)(305945005)(426003)(14773001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3473; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93f4d3ad-86e7-4cc9-ffa8-08d7175bc25e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3473; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3473:
X-Microsoft-Antispam-PRVS: <BN8PR12MB34739A7FA1A15730FA8FB4D4ECD90@BN8PR12MB3473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 011787B9DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: C2SXtiALJQH0vMgbSep2cWnzsXyrXLyJBTEMbNmW24XUhbIG82pIRsg5vwsBYLyqqD9ts4Xcn7MMI3WxL9xkZCZnw8Z3Ck74/e5eMFyd7qIAGVp7o4r3CdwWvuxiTBw8A1oxI56pcyb1nYX2VHdQXfAsV9RXhNbwDVaXwTU4CuqysQxQ9BfxwYEyJMBM516SWbPmeJkKb3kWqDIIqHyYjqqSXUXx3QIra8eVJmtf5TXU7Q660wEGNuFWxEjkJ7EUQOxtB3DaN7ZsRH0CbbaConMOMvtlrsf+KihFjN6EyQhB2iB7i3rOrnqWs5gnYxwqVG+2JuJmsO/pl1xbaOzZStndxBsv7HjSJnYtMbDNAVSgEIIB02eDoQ5SDacasRjAxCzX56Xi0bF1xc05cmEcAMMuk8gLLNHmMJxtsMYVu9Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 15:11:56.5121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f4d3ad-86e7-4cc9-ffa8-08d7175bc25e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3473
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZVicyugus6plAWExAsZLGBnyLhYsQdxb5PdF92cd3k=;
 b=oCI0fptqgTV60NlHtpSaFVwklnBk/0voXlOS0kDjOLq89tBKGUVMX0vpyBE4ZoPKhhhPY9T7glEFo7y1vkzxTHroyphlF6TLbQJQxaArT4YasAcLgAftuYD1gJrhPnCoVMjfwAXTn435fSH/jwMCoACu6HDWBjdjYB/JlgCM+RM=
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
Cc: Leo Li <sunpeng.li@amd.com>, David Francis <david.francis@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVW5kZXJmbG93IGNhbiBvY2N1ciBpbiB0aGUgY2FzZSB3aGVyZSB3ZSBjaGFuZ2UgYnVm
ZmVyIHBpdGNoLCBEQ0Mgc3RhdGUsCnJvdGF0aW9uIG9yIG1pcnJvcmluZyBmb3IgYSBwbGFuZSB3
aGlsZSBhbHNvIHBlcmZvcm1pbmcgYW4gaW1tZWRpYXRlCmZsaXAuIEl0IGNhbiBhbHNvIGdlbmVy
YXRlIGEgcC1zdGF0ZSB3YXJuaW5nIHN0YWNrIHRyYWNlIG9uIERDTjEgd2hpY2gKaXMgdHlwaWNh
bGx5IG9ic2VydmVkIGR1cmluZyB0aGUgY3Vyc29yIGhhbmRsZXIgcGlwZSBsb2NraW5nIGJlY2F1
c2Ugb2YKaG93IGZyZXF1ZW50IGN1cnNvciB1cGRhdGVzIGNhbiBvY2N1ci4KCltIb3ddClN0b3Jl
IHRoZSB1cGRhdGUgdHlwZSBvbiBlYWNoIENSVEMgLSBldmVyeSBwbGFuZSB3aWxsIGhhdmUgYWNj
ZXNzIHRvCnRoZSBDUlRDIHN0YXRlIGlmIGl0J3MgZmxpcHBpbmcuIElmIHRoZSB1cGRhdGUgdHlw
ZSBpcyBub3QKVVBEQVRFX1RZUEVfRkFTVCB0aGVuIHRoZSBpbW1lZGlhdGUgZmxpcCBzaG91bGQg
YmUgZGlzYWxsb3dlZC4KCk5vIGNoYW5nZXMgdG8gdGhlIHRhcmdldCB2Ymxhbmsgc2VxdWVuY2lu
ZyBuZWVkIHRvIGJlIGRvbmUsIHdlIGp1c3QKbmVlZCB0byBlbnN1cmUgdGhhdCB0aGUgc3VyZmFj
ZSByZWdpc3RlcnMgZG8gYSBkb3VibGUgYnVmZmVyZWQgdXBkYXRlLgoKQ2M6IERhdmlkIEZyYW5j
aXMgPGRhdmlkLmZyYW5jaXNAYW1kLmNvbT4KQ2M6IEJoYXdhbnByZWV0IExha2hhIDxiaGF3YW5w
cmVldC5sYWtoYUBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNv
bT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgICAg
fCAxNiArKysrKysrKysrKysrKystCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmggICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYwppbmRleCBmZmIzYzcyNDdhYzYuLmU5NDFkMGQzNzk0YiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBA
IC01NjkwLDggKzU2OTAsMTQgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtX2NvbW1pdF9wbGFuZXMo
c3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAogCQlidW5kbGUtPnN1cmZhY2VfdXBkYXRl
c1twbGFuZXNfY291bnRdLnBsYW5lX2luZm8gPQogCQkJJmJ1bmRsZS0+cGxhbmVfaW5mb3NbcGxh
bmVzX2NvdW50XTsKIAorCQkvKgorCQkgKiBPbmx5IGFsbG93IGltbWVkaWF0ZSBmbGlwcyBmb3Ig
ZmFzdCB1cGRhdGVzIHRoYXQgZG9uJ3QKKwkJICogY2hhbmdlIEZCIHBpdGNoLCBEQ0Mgc3RhdGUs
IHJvdGF0aW9uIG9yIG1pcnJvaW5nLgorCQkgKi8KIAkJYnVuZGxlLT5mbGlwX2FkZHJzW3BsYW5l
c19jb3VudF0uZmxpcF9pbW1lZGlhdGUgPQotCQkJCShjcnRjLT5zdGF0ZS0+cGFnZWZsaXBfZmxh
Z3MgJiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMpICE9IDA7CisJCQkoY3J0Yy0+c3RhdGUtPnBh
Z2VmbGlwX2ZsYWdzICYKKwkJCSBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMpICE9IDAgJiYKKwkJ
CWFjcnRjX3N0YXRlLT51cGRhdGVfdHlwZSA9PSBVUERBVEVfVFlQRV9GQVNUOwogCiAJCXRpbWVz
dGFtcF9ucyA9IGt0aW1lX2dldF9ucygpOwogCQlidW5kbGUtPmZsaXBfYWRkcnNbcGxhbmVzX2Nv
dW50XS5mbGlwX3RpbWVzdGFtcF9pbl91cyA9IGRpdl91NjQodGltZXN0YW1wX25zLCAxMDAwKTsK
QEAgLTczMTEsNiArNzMxNywxNCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2so
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJc3RhdGUtPmFzeW5jX3VwZGF0ZSA9ICFkcm1fYXRv
bWljX2hlbHBlcl9hc3luY19jaGVjayhkZXYsIHN0YXRlKTsKIAl9CiAKKwkvKiBTdG9yZSB0aGUg
b3ZlcmFsbCB1cGRhdGUgdHlwZSBmb3IgdXNlIGxhdGVyIGluIGF0b21pYyBjaGVjay4gKi8KKwlm
b3JfZWFjaF9uZXdfY3J0Y19pbl9zdGF0ZSAoc3RhdGUsIGNydGMsIG5ld19jcnRjX3N0YXRlLCBp
KSB7CisJCXN0cnVjdCBkbV9jcnRjX3N0YXRlICpkbV9uZXdfY3J0Y19zdGF0ZSA9CisJCQl0b19k
bV9jcnRjX3N0YXRlKG5ld19jcnRjX3N0YXRlKTsKKworCQlkbV9uZXdfY3J0Y19zdGF0ZS0+dXBk
YXRlX3R5cGUgPSAoaW50KW92ZXJhbGxfdXBkYXRlX3R5cGU7CisJfQorCiAJLyogTXVzdCBiZSBz
dWNjZXNzICovCiAJV0FSTl9PTihyZXQpOwogCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaAppbmRleCBkYTQ4YTg1Nzk0
OWYuLmNiZDY2MDhmNThlNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5oCkBAIC0zMDcsNiArMzA3LDcgQEAgc3RydWN0IGRtX2NydGNf
c3RhdGUgewogCWJvb2wgY21faGFzX2RlZ2FtbWE7CiAJYm9vbCBjbV9pc19kZWdhbW1hX3NyZ2I7
CiAKKwlpbnQgdXBkYXRlX3R5cGU7CiAJaW50IGFjdGl2ZV9wbGFuZXM7CiAJYm9vbCBpbnRlcnJ1
cHRzX2VuYWJsZWQ7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
