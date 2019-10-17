Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B75EDB74C
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2019 21:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3A66EAE4;
	Thu, 17 Oct 2019 19:16:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730088.outbound.protection.outlook.com [40.107.73.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDAB6EAC4
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 19:15:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVkny7Xizmslo/MxQMFj/v+nOcd2BX6YPd3H/fBppeamT75yItT+6gXHJlg9Xqbmn1KGQEtIEZBWLJ4lUpA5CdOKe/hrSDEf0mpd3Wj5hd+UNEyK3QkgvjNcOLiw4rTI0l1uja/cHuei6BpJhQ/7fYHOuumVJd7E+zMTCQJ56M5CZmRym35FKMSjj1h7juls5e2dv9mhnVwxCCAtrEiFpb4vuuDU/+okxPfZ3GnxktJhmyKHUTjsmKsMLCMNEBFp6kcSdIUR4EDOuEFPeAH+LlWUCIWrNMbfbSSH0IxCTmxgJGe/D/nYPJnR39hZ72kS+ZLalvLxK39M+0JHihkiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2uFYx0Lv5pMSaCGKtNlfdW/z9mA3CVVF0EjI95jLS0=;
 b=FyaYX+FDzzq26Ta3uaTw6HaBCwui1O6i2hqYKbTcPROg5isqP4XFJ3XgxregfOcaZASnyOoy59fNu9IwtSKVZcNXc44pdTMTxIU8lXJtKw0qngasa0OFwmz9uhtQ7fLYCi3LFkFvH2Vlgc1M0yzhDj54SVBu9+vifoDPIqwGOXn47OBGAJKjwXcoMY6vCMKUXS4sZgr3aOIuHRSEhgL9lEOrt/CzWWok7xxyFlBCpgQzOaTeuWbGww8L5BRgAHfHJyaasENSlUBhErXoO7ynnwHl67rdUUIwLDwwojS98O6zDII+Jt06iwolWh4VZZt9/Y9AMGR6nVnKgBQeKXDNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR1201CA0013.namprd12.prod.outlook.com
 (2603:10b6:405:4c::23) by MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Thu, 17 Oct
 2019 19:15:54 +0000
Received: from BY2NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by BN6PR1201CA0013.outlook.office365.com
 (2603:10b6:405:4c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Thu, 17 Oct 2019 19:15:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT046.mail.protection.outlook.com (10.152.85.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Thu, 17 Oct 2019 19:15:53 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 17 Oct
 2019 14:15:51 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Thu, 17 Oct 2019 14:15:51 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 32/37] drm/amd/display: take signal type from link
Date: Thu, 17 Oct 2019 15:13:24 -0400
Message-ID: <20191017191329.11857-33-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017191329.11857-1-sunpeng.li@amd.com>
References: <20191017191329.11857-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(428003)(199004)(189003)(26005)(6916009)(8676002)(2616005)(486006)(476003)(11346002)(126002)(186003)(81166006)(81156014)(336012)(5660300002)(356004)(76176011)(51416003)(305945005)(6666004)(14444005)(426003)(8936002)(1076003)(50226002)(446003)(2876002)(70586007)(70206006)(2351001)(2906002)(478600001)(2870700001)(48376002)(54906003)(47776003)(50466002)(86362001)(316002)(4326008)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3997; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ace32936-58c8-48b9-41b2-08d753366e45
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39974D1819C082DCF52D0111826D0@MN2PR12MB3997.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 01930B2BA8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q48FD+D0UF0AUCso2NQDBeirBwwLnJzt/KW7KVEc5cM1eLxAp3pvbNq+RyxKurgM2Qew3LkrhWCMLu/+7c86sSSbdAy45HOa5ZvBxWfRAwMI3nq586UjC5xFUagW3NDULPFoCFay3YbjY0TflJOlSM2gIDiI2K4Czv/6evrcHUpFCTQ1KheXGmJlLiok29ZIRkVji2B0hruue2VETWCqNGvW0SwVdPDU6sxTFWmaZMju5wjiMIeqnMbTfGXMNDcQyrQWk938CJmCPGLGsPYMUgn3Id4tQSpgi4vLVNqSK6duv/3BKGFv3QVp1O4847Dcr2FfXrtaDswhLK9fG8D3NQtdjwbpYZtAQQgswRIdrgVOm+CQiNcNj5GwO+0LSzOwTi9Cz6on79wQeQ/kNhZbfP68JqXOUKc4Um1LMklKkoI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2019 19:15:53.8265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ace32936-58c8-48b9-41b2-08d753366e45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3997
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2uFYx0Lv5pMSaCGKtNlfdW/z9mA3CVVF0EjI95jLS0=;
 b=uWD40JvHGPtv6Iqji58RjsPXBsBOPYogPIgE1fxPmdiplrpabkWwwoXrewe1erXbMN6B78hlvp5vlqStUBYEj1xa1G2+4zdbwxuaMcmxbR50Tfxiy5CnnV6K1BnoatWE+9cnFfhKEVjpmQjaRa3FwsOyrc7/deJeWAVk5QiqoAs=
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
Cc: Leo Li <sunpeng.li@amd.com>, Lewis Huang <Lewis.Huang@amd.com>,
 Eric Yang <eric.yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbV2h5XQpTaWduYWwgaXMg
dXBkYXRlIHRvIEVEUCB3aGVuIGRyaXZlciBkaXNhYmxlIGZpcnN0IGVuY29kZXIuIFRoZQpmb2xs
b3dpbmcgZW5jb2RlciB1c2luZyBTSUdOQUxfVFlQRV9FRFAgdG8gaGFuZGxlIG90aGVyCmRldmlj
ZS4gV2hlbiBlbmNvZGVyIHNpZ25hbCBpcyBIRE1JLCBkcml2ZXIgd2lsbCBkZXRlY3QgaXQgaXMg
ZHAKYW5kIHJlbGVhc2UgcGh5LiBJdCBjYXVzZSBodyBoYW5nLgoKW0hvd10KVGFrZSBzaWduYWwg
dHlwZSBmcm9tIGxpbmstPmNvbm5lY3Rvcl9zaWduYWwuCgpTaWduZWQtb2ZmLWJ5OiBMZXdpcyBI
dWFuZyA8TGV3aXMuSHVhbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgWWFuZyA8ZXJpYy55
YW5nMkBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jICAgfCAx
MSArKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEw
L2RjZTExMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCmluZGV4IDkxNTBlNTQ2ZGNmMi4uZjBlODM3ZDE0
MDAwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2Rj
ZTExMF9od19zZXF1ZW5jZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYwpAQCAtMTQyMSw4ICsxNDIxLDYgQEAgc3RhdGlj
IGVudW0gZGNfc3RhdHVzIGFwcGx5X3NpbmdsZV9jb250cm9sbGVyX2N0eF90b19odygKIHN0YXRp
YyB2b2lkIHBvd2VyX2Rvd25fZW5jb2RlcnMoc3RydWN0IGRjICpkYykKIHsKIAlpbnQgaTsKLQll
bnVtIGNvbm5lY3Rvcl9pZCBjb25uZWN0b3JfaWQ7Ci0JZW51bSBzaWduYWxfdHlwZSBzaWduYWwg
PSBTSUdOQUxfVFlQRV9OT05FOwogCiAJLyogZG8gbm90IGtub3cgQklPUyBiYWNrLWZyb250IG1h
cHBpbmcsIHNpbXBseSBibGFuayBhbGwuIEl0IHdpbGwgbm90CiAJICogaHVydCBmb3Igbm9uLURQ
CkBAIC0xNDMzLDE1ICsxNDMxLDEyIEBAIHN0YXRpYyB2b2lkIHBvd2VyX2Rvd25fZW5jb2RlcnMo
c3RydWN0IGRjICpkYykKIAl9CiAKIAlmb3IgKGkgPSAwOyBpIDwgZGMtPmxpbmtfY291bnQ7IGkr
KykgewotCQljb25uZWN0b3JfaWQgPSBkYWxfZ3JhcGhpY3Nfb2JqZWN0X2lkX2dldF9jb25uZWN0
b3JfaWQoZGMtPmxpbmtzW2ldLT5saW5rX2lkKTsKLQkJaWYgKChjb25uZWN0b3JfaWQgPT0gQ09O
TkVDVE9SX0lEX0RJU1BMQVlfUE9SVCkgfHwKLQkJCShjb25uZWN0b3JfaWQgPT0gQ09OTkVDVE9S
X0lEX0VEUCkpIHsKKwkJZW51bSBzaWduYWxfdHlwZSBzaWduYWwgPSBkYy0+bGlua3NbaV0tPmNv
bm5lY3Rvcl9zaWduYWw7CiAKKwkJaWYgKChzaWduYWwgPT0gU0lHTkFMX1RZUEVfRURQKSB8fAor
CQkJKHNpZ25hbCA9PSBTSUdOQUxfVFlQRV9ESVNQTEFZX1BPUlQpKQogCQkJaWYgKCFkYy0+bGlu
a3NbaV0tPndhX2ZsYWdzLmRwX2tlZXBfcmVjZWl2ZXJfcG93ZXJlZCkKIAkJCQlkcF9yZWNlaXZl
cl9wb3dlcl9jdHJsKGRjLT5saW5rc1tpXSwgZmFsc2UpOwotCQkJaWYgKGNvbm5lY3Rvcl9pZCA9
PSBDT05ORUNUT1JfSURfRURQKQotCQkJCXNpZ25hbCA9IFNJR05BTF9UWVBFX0VEUDsKLQkJfQog
CiAJCWRjLT5saW5rc1tpXS0+bGlua19lbmMtPmZ1bmNzLT5kaXNhYmxlX291dHB1dCgKIAkJCQlk
Yy0+bGlua3NbaV0tPmxpbmtfZW5jLCBzaWduYWwpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
