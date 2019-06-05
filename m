Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD063615F
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 18:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3C989D5B;
	Wed,  5 Jun 2019 16:34:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800070.outbound.protection.outlook.com [40.107.80.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8090489D5B
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 16:34:05 +0000 (UTC)
Received: from MWHPR12CA0029.namprd12.prod.outlook.com (2603:10b6:301:2::15)
 by BN6PR1201MB0051.namprd12.prod.outlook.com (2603:10b6:405:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.12; Wed, 5 Jun
 2019 16:34:03 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by MWHPR12CA0029.outlook.office365.com
 (2603:10b6:301:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.13 via Frontend
 Transport; Wed, 5 Jun 2019 16:34:03 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Wed, 5 Jun 2019 16:34:02 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Wed, 5 Jun 2019
 11:34:02 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Use current connector state if NULL when
 checking bpc
Date: Wed, 5 Jun 2019 12:33:59 -0400
Message-ID: <20190605163359.19422-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(336012)(6916009)(6666004)(70586007)(5660300002)(356004)(16586007)(47776003)(48376002)(426003)(50466002)(476003)(72206003)(2616005)(44832011)(53416004)(186003)(486006)(36756003)(1076003)(86362001)(8676002)(305945005)(126002)(2906002)(68736007)(478600001)(316002)(54906003)(4326008)(70206006)(26005)(50226002)(8936002)(7696005)(53936002)(81166006)(77096007)(2351001)(51416003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0051; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8a4b991-9cf2-436c-9501-08d6e9d39ecf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR1201MB0051; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0051:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0051685D4642A79CDB74A4A6EC160@BN6PR1201MB0051.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 00594E8DBA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: NPOOe/GkJbGE2EiYnJ3UA+95e0vNomoFkY99M5hyIE1pfHmFXqdErQvKTfqN5Zmg9fSt42oEVs+VsRF2D2WAIgTxJukB4vPg3ltnWRVLeGofkNf4MSX3h3/ioBKFQIVhhF4OM8Q5jM3CPUL/6M5alRRuv3h31H2D92IE3JhEyTxDNvgYrKAKcWGFOtuizUNYWfWCzUPDPCPydYRZzemNqEXQJxQs2ah4+JQp5cjvE/AkbF6GbaQu/ZGFw8VqFobk2+erRzO1eobfqnQLBUDBAk+RrK/XZcVUmTzD5t0ZIradCmZ4P6wD6LxTY4d7Y2Bwm/uedmUNOuGn+UiXA/rU4oHKciWKEStnY42cpKaWjXEnWDi/3l/oJrRBbeMgh384CBoNZ6j4YM/jzbcvGwSo/pNHjcG7HE8C3+kMh25eob4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2019 16:34:02.9407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a4b991-9cf2-436c-9501-08d6e9d39ecf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0051
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0c4pCskzMv0u2ngY9MXyTB0ixAmV1xStLH+rKGn1mo=;
 b=xGQgtu1pDWrFA5TEB42yaNI4bY0QZwbkrurDT8RmKzhDIOy5tyvjdY/6Tv/FbDdVpjOhW8Men+ItzYm+jMAEzFnNdltgm1JghLvSh9z+ByIZxlVEXGmB/SUeeQOK+j78ajPsbSJdw1QrmQL87wkPalhy/Dp86l+2R3Fi+1eBIpg=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KVGhlIG9sZCBsb2dpYyBmb3IgY2hlY2tpbmcgd2hpY2ggb3V0cHV0IGRlcHRoIHRvIHVz
ZSByZWxpZWQgb24gdXNpbmcKdGhlIGN1cnJlbnQgY29ubmVjdG9yIHN0YXRlIHJhdGhlciB0aGFu
IHRoZSBuZXcgcHJvcG9zZWQgc3RhdGUuIFRoaXMKd2FzIGEgcHJvYmxlbSB3aGVuIHBlcmZvcm1p
bmcgYXRvbWljIGNvbW1pdHMgc2luY2Ugd2Ugd2VyZW4ndCB2ZXJpZnlpbmcKaXQgYWdhaW5zdCB0
aGUgaW5jb21pbmcgbWF4X3JlcXVlc3RlZF9icGMuCgpCdXQgc3dpdGNoaW5nIHRoaXMgdG8gb25s
eSB1c2UgdGhlIG5ldyBzdGF0ZSBhbmQgbm90IHRoZSBjdXJyZW50IHN0YXRlCmJyZWFrcyBmaWx0
ZXJpbmcgbW9kZXMgLSBpdCdsbCBhbHdheXMgYXNzdW1lIHRoYXQgdGhlIG1heGltdW0gYnBjCnN1
cHBvcnRlZCBieSB0aGUgZGlzcGxheSBpcyBpbiB1c2UsIHdoaWNoIHdpbGwgY2F1c2UgY2VydGFp
biBtb2RlcwpsaWtlIDE0NDBwQDE0NEh6IHRvIGJlIGZpbHRlcmVkIGV2ZW4gd2hlbiB1c2luZyA4
YnBjLgoKW0hvd10KU3RpbGwgdXNlIHRoZSBjb25uZWN0b3ItPnN0YXRlIGlmIHdlIGFyZW4ndCBw
YXNzZWQgYW4gZXhwbGljaXQgc3RhdGUuClRoaXMgd2lsbCByZXNwZWN0IHRoZSBtYXhfYnBjIHRo
ZSB1c2VyIGN1cnJlbnRseSBoYXMgd2hlbiBmaWx0ZXJpbmcKbW9kZXMuCgpBbHNvIHJlbWVtYmVy
IHRvIHJlc2V0IHRoZSBkZWZhdWx0IG1heF9yZXF1ZXN0ZWRfYnBjIHRvIDggd2hlbmV2ZXIKY29u
bmVjdG9yIHJlc2V0IGlzIGNhbGxlZCB0byByZXRhaW4gb2xkIGJlaGF2aW9yIHdoZW4gdXNpbmcg
dGhlIG5ldwpwcm9wZXJ0eS4KCkNjOiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1k
LmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNo
b2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDQgKysrKwogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGE2OThjOGYyNzJlZC4uZjYyN2Mx
N2ExMDM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMKQEAgLTMwNDYsNiArMzA0Niw5IEBAIGNvbnZlcnRfY29sb3JfZGVwdGhfZnJv
bV9kaXNwbGF5X2luZm8oY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIHsK
IAl1aW50MzJfdCBicGMgPSBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGM7CiAKKwlpZiAoIXN0
YXRlKQorCQlzdGF0ZSA9IGNvbm5lY3Rvci0+c3RhdGU7CisKIAlpZiAoc3RhdGUpIHsKIAkJYnBj
ID0gc3RhdGUtPm1heF9icGM7CiAJCS8qIFJvdW5kIGRvd24gdG8gdGhlIG5lYXJlc3QgZXZlbiBu
dW1iZXIuICovCkBAIC0zODIwLDYgKzM4MjMsNyBAQCB2b2lkIGFtZGdwdV9kbV9jb25uZWN0b3Jf
ZnVuY3NfcmVzZXQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAkJc3RhdGUtPnVu
ZGVyc2Nhbl9lbmFibGUgPSBmYWxzZTsKIAkJc3RhdGUtPnVuZGVyc2Nhbl9oYm9yZGVyID0gMDsK
IAkJc3RhdGUtPnVuZGVyc2Nhbl92Ym9yZGVyID0gMDsKKwkJc3RhdGUtPmJhc2UubWF4X3JlcXVl
c3RlZF9icGMgPSA4OwogCiAJCV9fZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0KGNv
bm5lY3RvciwgJnN0YXRlLT5iYXNlKTsKIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
