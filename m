Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393BC10186
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 23:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B20A89270;
	Tue, 30 Apr 2019 21:10:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810040.outbound.protection.outlook.com [40.107.81.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E462689254
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 21:10:06 +0000 (UTC)
Received: from DM3PR12CA0106.namprd12.prod.outlook.com (2603:10b6:0:55::26) by
 SN1PR12MB0656.namprd12.prod.outlook.com (2a01:111:e400:c428::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Tue, 30 Apr
 2019 21:10:04 +0000
Received: from BY2NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by DM3PR12CA0106.outlook.office365.com
 (2603:10b6:0:55::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1856.10 via Frontend
 Transport; Tue, 30 Apr 2019 21:10:04 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT009.mail.protection.outlook.com (10.152.84.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 21:10:04 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 16:09:53 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/20] drm/amd/display: Add basic downscale and upscale
 valdiation
Date: Tue, 30 Apr 2019 17:09:25 -0400
Message-ID: <20190430210938.32335-28-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
References: <20190430210938.32335-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(2980300002)(428003)(199004)(189003)(476003)(8676002)(1076003)(11346002)(6666004)(356004)(126002)(486006)(7696005)(70206006)(70586007)(5660300002)(76176011)(47776003)(14444005)(53416004)(426003)(446003)(478600001)(2616005)(2906002)(4326008)(72206003)(68736007)(86362001)(53936002)(8936002)(51416003)(50226002)(81156014)(36756003)(81166006)(50466002)(6916009)(316002)(305945005)(26005)(186003)(77096007)(336012)(2351001)(48376002)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB0656; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40d24f52-d800-4302-4ded-08d6cdb0371a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:SN1PR12MB0656; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB0656:
X-Microsoft-Antispam-PRVS: <SN1PR12MB065683500498C6C8A3AF2B02F93A0@SN1PR12MB0656.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BsITEODmSXAg1mg04xQw1hkF5/ofFOKE8h1Ae7kuFGQ8pBp9bZCCEQ7DRvRZ7DA4qItABdLkM9ZfoCyiT0wdQWI27mvC6DREgBca3HycNm1EHDXbSdTI9BfLZ3LmHx3cq9P5U3xmFecayOe4ipFtHXkW+2QH58z1Am4H0AgP7rWOYTEt62xVi3jXZjEXlrJYGTIeW4wmDhEEZwCxoaycQ0JHfAGQo+mM8c3pEfyCfceOg6/n9U1PNYmNHs/+GZMvbL9jAuK4yU7rKFBdYDTXp9AySeDkSOsHiNy/2jvT6H0RseLl7OPvGy6tF+kp9AxDbp1gmqCRo8aG/whImP8beHiRWMPwW+YlLzAbrCIKz56xUK3y3p7Pnrbt39snwXelFVbtQE44jNaoUA/hMtX3lIW1j0efsBzYPZ7V423QaS4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 21:10:04.0151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d24f52-d800-4302-4ded-08d6cdb0371a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB0656
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkBbOjiJeHdVpbX/ajEKoq18+SFHbl3Ay5HRn8weMBk=;
 b=1YxDurFJJ8BFIAs/glQowdrGozZqsY4w5yjKZdLbqTRSYLFIdQGnxAYyB2rxsBkyJ2pAph/8sab7MTYiDNo1VXkIWIo8WcNbjJlucArdvsAw7qSr1/ka4dtXm/hlQMNOuW7FCUVumwwzVQrxuAs5QSmTZ2i2pL5wDL4uTc/e4Nw=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KUGxhbmVzIGhhdmUgZG93bnNjYWxpbmcgbGltaXRzIGFuZCB1cHNjYWxpbmcgbGltaXRz
IHBlciBmb3JtYXQgYW5kIERNCmlzIGV4cGVjdGVkIHRvIHZhbGlkYXRlIHRoZXNlIHVzaW5nIERD
IGNhcHMuIFdlIHNob3VsZCBmYWlsIGF0b21pYwpjaGVjayB2YWxpZGF0aW9uIGlmIHdlIGFyZW4n
dCBjYXBhYmxlIG9mIGRvaW5nIHRoZSBzY2FsaW5nLgoKW0hvd10KV2UgZG9uJ3QgY3VycmVudGx5
IGNyZWF0ZSBzdG9yZSB3aGljaCBEQyBwbGFuZSBtYXBzIHRvIHdoaWNoIERSTSBwbGFuZQpzbyB3
ZSBjYW4ndCBlYXNpbHkgY2hlY2sgdGhlIGNhcHMgZGlyZWN0bHkuIEZvciBub3cgYWRkIGJhc2lj
CmNvbnN0cmFpbnRzIHRoYXQgY292ZXIgdGhlIGFic29sdXRlIG1pbiBhbmQgbWF4IGRvd25zY2Fs
ZSAvIHVwc2NhbGUKbGltaXRzIGZvciBtb3N0IFJHQiBhbmQgWVVWIGZvcm1hdHMgYWNyb3NzIEFT
SUNzLgoKTGVhdmUgYSBUT0RPIGluZGljYXRpbmcgdGhhdCB0aGVzZSBzaG91bGQgcmVhbGx5IGJl
IGRvbmUgd2l0aCBEQyBjYXBzLgpXZSdsbCBwcm9iYWJseSBuZWVkIHRvIHN1YmNsYXNzIERSTSBw
bGFuZXMgYWdhaW4gaW4gb3JkZXIgdG8gY29ycmVjdGx5CmlkZW50aWZ5IHdoaWNoIERDIHBsYW5l
IG1hcHMgdG8gaXQuCgpDaGFuZ2UtSWQ6IEkxODUyNGQwZTVkOGE5NmFlM2FlMGU1ZDBlYjM5MDYw
OTIyMDFhMTI1ClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmth
emxhdXNrYXNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxIYXJyeS5XZW50
bGFuZEBhbWQuY29tPgpSZXZpZXdlZC1ieTogVG9ueSBDaGVuZyA8VG9ueS5DaGVuZ0BhbWQuY29t
PgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0IExha2hhQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8
IDE1ICsrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpp
bmRleCAyZTU2ODk0MTI4NzEuLmY4YWFmOWExYjZiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0yNDYyLDYgKzI0NjIsOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9lbmNvZGVyX2Z1bmNzIGFtZGdwdV9kbV9lbmNvZGVy
X2Z1bmNzID0gewogc3RhdGljIGludCBmaWxsX2RjX3NjYWxpbmdfaW5mbyhjb25zdCBzdHJ1Y3Qg
ZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSwKIAkJCQlzdHJ1Y3QgZGNfc2NhbGluZ19pbmZvICpzY2Fs
aW5nX2luZm8pCiB7CisJaW50IHNjYWxlX3csIHNjYWxlX2g7CisKIAltZW1zZXQoc2NhbGluZ19p
bmZvLCAwLCBzaXplb2YoKnNjYWxpbmdfaW5mbykpOwogCiAJLyogU291cmNlIGlzIGZpeGVkIDE2
LjE2IGJ1dCB3ZSBpZ25vcmUgbWFudGlzc2EgZm9yIG5vdy4uLiAqLwpAQCAtMjQ5Miw2ICsyNDk0
LDE5IEBAIHN0YXRpYyBpbnQgZmlsbF9kY19zY2FsaW5nX2luZm8oY29uc3Qgc3RydWN0IGRybV9w
bGFuZV9zdGF0ZSAqc3RhdGUsCiAJLyogRFJNIGRvZXNuJ3Qgc3BlY2lmeSBjbGlwcGluZyBvbiBk
ZXN0aW5hdGlvbiBvdXRwdXQuICovCiAJc2NhbGluZ19pbmZvLT5jbGlwX3JlY3QgPSBzY2FsaW5n
X2luZm8tPmRzdF9yZWN0OwogCisJLyogVE9ETzogVmFsaWRhdGUgc2NhbGluZyBwZXItZm9ybWF0
IHdpdGggREMgcGxhbmUgY2FwcyAqLworCXNjYWxlX3cgPSBzY2FsaW5nX2luZm8tPmRzdF9yZWN0
LndpZHRoICogMTAwMCAvCisJCSAgc2NhbGluZ19pbmZvLT5zcmNfcmVjdC53aWR0aDsKKworCWlm
IChzY2FsZV93IDwgMjUwIHx8IHNjYWxlX3cgPiAxNjAwMCkKKwkJcmV0dXJuIC1FSU5WQUw7CisK
KwlzY2FsZV9oID0gc2NhbGluZ19pbmZvLT5kc3RfcmVjdC5oZWlnaHQgKiAxMDAwIC8KKwkJICBz
Y2FsaW5nX2luZm8tPnNyY19yZWN0LmhlaWdodDsKKworCWlmIChzY2FsZV9oIDwgMjUwIHx8IHNj
YWxlX2ggPiAxNjAwMCkKKwkJcmV0dXJuIC1FSU5WQUw7CisKIAkvKgogCSAqIFRoZSAic2NhbGlu
Z19xdWFsaXR5IiBjYW4gYmUgaWdub3JlZCBmb3Igbm93LCBxdWFsaXR5ID0gMCBoYXMgREMKIAkg
KiBhc3N1bWUgcmVhc29uYWJsZSBkZWZhdWx0cyBiYXNlZCBvbiB0aGUgZm9ybWF0LgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
