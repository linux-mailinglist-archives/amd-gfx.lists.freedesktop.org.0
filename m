Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10BC90A0
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D4F6E976;
	Wed,  2 Oct 2019 18:17:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87946E976
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbCVWYSseCjpyEUw10ocOs4IJbINr2ed08ObE+lmijOjfb+tKDxJbeAK5FJwVLhID5za+nY46yLeNbgD69VrvK0GIYMeJE0i2KTo4LZv2UyxWJt5gJOUx/US9Bws2yWI8hTsMS74mtVdLcs1KICi48mtnJcknGGxdUzf8acHqReb5zxxZcW9SMuqPS6DU7y0P8S/d/ZAusL+RtjT10PXo51jyQRFtBw8QxYll7N6a/xNW63QGTh1eWs4WsIkkdyJmZCFKuV1bL7UJM7qgYacURMBJ2t1XctC0STVJq6+niM+pk95SHxyzQcRpLz659DA+kUiNF/mg2xyX9lfjOK+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15bi0mtvtV+qaOQI0e9WS8TxBSE6zndR67Br2vDHwjc=;
 b=KpRASyIAZrI1IG7rHxlCwDNh2yPs8HbmtFOYU1iPSF/ncB2lyMwuPJzXt3cW21ApvEcpoyHuCbkCH+uaohcvcZYlepKLn1TSwOru3x2G86fPJEwCqcap1WZ6X4nWIJEqzAs2393LilYIXsXsnU839mXsZ/ltZbXHKHHl3G3kkCtbJWnZ7Z3VCGmYUxeR9LoEy3C0AqfdmBz5qLCYM2OUWUFU0zIl7AOAaOnF81J9XDSNe7ZyfN1U8m3idRGgTY3v61XI1eY19xaBQKMht6GDykbmIOH2PscKBL1TzEjn/7OWY+kfxkTzjBGG7YevCZk87oeFYOFgH5DjCGayQCycoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0098.namprd12.prod.outlook.com (2603:10b6:0:55::18) by
 DM6PR12MB3433.namprd12.prod.outlook.com (2603:10b6:5:3b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Wed, 2 Oct 2019 18:16:55 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM3PR12CA0098.outlook.office365.com
 (2603:10b6:0:55::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:55 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:54 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 35/38] drm/amd/display: correct stream LTE_340MCSC_SCRAMBLE
 value
Date: Wed, 2 Oct 2019 14:16:30 -0400
Message-ID: <20191002181633.22805-36-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(428003)(199004)(189003)(51416003)(356004)(76176011)(36756003)(86362001)(4326008)(6666004)(7696005)(70206006)(70586007)(53416004)(2906002)(26005)(2351001)(336012)(186003)(6916009)(50466002)(316002)(50226002)(14444005)(16586007)(2616005)(11346002)(126002)(476003)(446003)(426003)(5660300002)(48376002)(478600001)(81166006)(8936002)(81156014)(8676002)(305945005)(486006)(1076003)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3433; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e77d588e-8ce1-4d66-1ded-08d74764b4d9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3433:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3433993307E595DDE36CDB94F99C0@DM6PR12MB3433.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yZTAFT6GO7CG0lZRjgXRw1NFKRacp6hOfONnVXK/QGrksh/v5D4HbBPYBBwQK+nu6dBM7SaxoxHD/8cNto2QTcFT/mc9/gJtjD7ZofAudGQusFUtpDrSybL1Ll4RnnInCdNHKYuD7ng9OllPpv5DS0HR17TQblmBeRRW0c3VyQqBj6yj7BoSgwwJImSaKA5YGwkWsJjlVr0a084DszwnxVTgPf523xB7A1nbA4qlvSD9eblUO1CecYNf2aGH18OxZ9OLTEh+3MJOaLl402q+M/cO8sNVfCkUbpA4GGvPhpELaodSw2aMU0hrqUz9zUH5WeA+OScWzRH54LaB8cm33ZjBynJPLaebXB7B7zfyjY2Mxk4wJZH1B1nFD0HzO7QYPCgG/O6aYazhjTpRBW8uHx3LY5vURu8NqnT+gjPUAvo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:55.1383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e77d588e-8ce1-4d66-1ded-08d74764b4d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3433
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15bi0mtvtV+qaOQI0e9WS8TxBSE6zndR67Br2vDHwjc=;
 b=FuScHzjbEWvlU/POzNwrTQcDfEHpieRsLOhcCgaBxjIuqh1gTeRYrIec44bpNhJydMBtX8PzOFM3Dy2azJcM+7BangIJGr8otFGiM0O84prem58QzlVYRzB1hckP8WloXud+FxhgN+t3iMSgIPF4Xlw8zVPFiljRyl0YU3YJTYI=
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
Cc: Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KCltXaHldCkhETUkgMi4wIHJlcXVp
cmVzIHNjcmFtYmxpbmcgdW5kZXIgc3BlY2lmaWMgY29uZGl0aW9ucy4gV2UgcmVmZXIgdG8Kc3Ry
ZWFtIHByb3BlcnR5IExURV8zNDBNQ1NDX1NDUkFNQkxFIHRvIGRldGVybWluZSB3aGV0aGVyIGVu
L2RpcwpzY3JhbWJsaW5nLgpXaGlsZSBjcmVhdGluZyBzdHJlYW0gZm9yIHNpbmssIHdlIHNldHVw
IExURV8zNDBNQ1NDX1NDUkFNQkxFIGJ5CnJlZmVycmluZyB0byBlZGlkX2NhcHMuIEhvd2V2ZXIs
IGRtX2hlbHBlcnNfcGFyc2VfZWRpZF9jYXBzKCkKZG9lc24ndCBjb25zdHJ1Y3QgSERNSSBGb3J1
bSBibG9jayBkYXRhIGZvciBlZGlkX2NhcHMuCk1vcmVvdmVyLCBmaWxsX3N0cmVhbV9wcm9wZXJ0
aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZSgpIGFzbG8KdW5jb25zY2lvdXNseSBjbGVhciB0aGUg
TFRFXzM0ME1DU0NfU0NSQU1CTEUgZmxhZy4KCltIb3ddCkRybSBhbHJlYWR5IHByb3ZpZGVzIGRy
bV9kaXNwbGF5X2luZm8gdG8gcmVmZXIgSERNSSBGb3J1bSB2c2RiIGluZm8uClNldCBzdHJlYW0g
TFRFXzM0ME1DU0NfU0NSQU1CTEUgYnkgZHJtX2Rpc3BsYXlfaW5mbyBhbmQgcmVtb3ZlCm1lbXNl
dCBpbiBmaWxsX3N0cmVhbV9wcm9wZXJ0aWVzX2Zyb21fZHJtX2Rpc3BsYXlfbW9kZSgpCgpDaGFu
Z2UtSWQ6IEk0NDNhOGQwMzQ2Yjk3NDcyZTQ1NGE5YzdmMzgyMmM0ZWUwYWQzZjg1ClNpZ25lZC1v
ZmYtYnk6IFdheW5lIExpbiA8V2F5bmUuTGluQGFtZC5jb20+ClJldmlld2VkLWJ5OiBOaWNob2xh
cyBLYXpsYXVza2FzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3
YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNCArKystCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggZGQyOTY0YTkx
ZTE3Li5hZDZmODcwNThhYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMzQ3MCw3ICszNDcwLDYgQEAgc3RhdGljIHZvaWQg
ZmlsbF9zdHJlYW1fcHJvcGVydGllc19mcm9tX2RybV9kaXNwbGF5X21vZGUoCiAJc3RydWN0IGFt
ZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IgPSB0b19hbWRncHVfZG1fY29ubmVjdG9yKGNv
bm5lY3Rvcik7CiAJc3RydWN0IGhkbWlfdmVuZG9yX2luZm9mcmFtZSBodl9mcmFtZTsKIAlzdHJ1
Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lIGF2aV9mcmFtZTsKLQltZW1zZXQodGltaW5nX291dCwgMCwg
c2l6ZW9mKHN0cnVjdCBkY19jcnRjX3RpbWluZykpOwogCiAJdGltaW5nX291dC0+aF9ib3JkZXJf
bGVmdCA9IDA7CiAJdGltaW5nX291dC0+aF9ib3JkZXJfcmlnaHQgPSAwOwpAQCAtMzczNCw2ICsz
NzMzLDkgQEAgY3JlYXRlX3N0cmVhbV9mb3Jfc2luayhzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3Rv
ciAqYWNvbm5lY3RvciwKIAogCXN0cmVhbS0+ZG1fc3RyZWFtX2NvbnRleHQgPSBhY29ubmVjdG9y
OwogCisJc3RyZWFtLT50aW1pbmcuZmxhZ3MuTFRFXzM0ME1DU0NfU0NSQU1CTEUgPQorCQlkcm1f
Y29ubmVjdG9yLT5kaXNwbGF5X2luZm8uaGRtaS5zY2RjLnNjcmFtYmxpbmcubG93X3JhdGVzOwor
CiAJbGlzdF9mb3JfZWFjaF9lbnRyeShwcmVmZXJyZWRfbW9kZSwgJmFjb25uZWN0b3ItPmJhc2Uu
bW9kZXMsIGhlYWQpIHsKIAkJLyogU2VhcmNoIGZvciBwcmVmZXJyZWQgbW9kZSAqLwogCQlpZiAo
cHJlZmVycmVkX21vZGUtPnR5cGUgJiBEUk1fTU9ERV9UWVBFX1BSRUZFUlJFRCkgewotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
