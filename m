Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80416F018B
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Nov 2019 16:35:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87FE6EABA;
	Tue,  5 Nov 2019 15:35:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC2B6EABA
 for <amd-gfx@lists.freedesktop.org>; Tue,  5 Nov 2019 15:35:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dpzaOKh30Maly9AUJw3Jntw80k38FZBENjsImEZX80ulI3lyoOBTudcaS8NT+mrbmu2YMQXjkQ0FT1+j2l2IyPUMKLuPwLWPuGVnGQOsgjiwN+FKYuxDKBmZA/kj1isbxjXC9gaV3br7RtmM8ZhCSmdwzRK/qugdYnC2cTWRZBHgzScMGBHRnBBMHmWyrpfsTnIZhWe/PjnkWB2p1qjWLiXMVrnwhfFVzG16ydbABqsEQLS4tl73+pyTOmouDeeSFLY1Sc3su9yZEuEDxzsMt0kXSTv6RjYrUrItPiQDNK2LrKp1wNLaV3ulJoj/OZbqqo8oINCIh6LSpfK3o+xtJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLguO31/rQLAVBq7vE9hMtEzQBiPnDJpj+oS4nZ4wWE=;
 b=Ti7XXli0Xadxyf8xxU2Ev0aRM3P5ag2jA67GAQ82uogphtm9A8YfSsXEs2ir++AETFoub/EkNcuO3WYABWxtRdpiovgRQza/vZvG7288B4mAOklBFqODP8uS85+RV/KPNWtrJoY1vF/ztsZ9abv+VWI7FKH9ZULWGTzwpd5Jmvzlb+kpKu9W16oKZqVHxONAXRwYwHYS0QU07B5qTIVg8N9jM9Wj+cT6wDa46WHbvcAcX4TdcXtzeopykYlcpKbzWs8miFFBtRP5g1J1+ivcb5PF9DhrCY/b1Fk1ltI3sf2Na7ZqzW8UBT3nTz+8Z+N+kQHfY+XaKSi/HyNvo0v5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR12CA0027.namprd12.prod.outlook.com (2603:10b6:903:129::13)
 by CY4PR1201MB0040.namprd12.prod.outlook.com (2603:10b6:910:1b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.24; Tue, 5 Nov
 2019 15:35:17 +0000
Received: from DM3NAM03FT031.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by CY4PR12CA0027.outlook.office365.com
 (2603:10b6:903:129::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.20 via Frontend
 Transport; Tue, 5 Nov 2019 15:35:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT031.mail.protection.outlook.com (10.152.82.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2387.20 via Frontend Transport; Tue, 5 Nov 2019 15:35:17 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 5 Nov 2019
 09:35:16 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Tue, 5 Nov 2019 09:35:16 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amd/display: Send vblank and user events at vsartup
 for DCN
Date: Tue, 5 Nov 2019 10:34:15 -0500
Message-ID: <20191105153416.32049-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(428003)(189003)(199004)(478600001)(186003)(1076003)(86362001)(305945005)(426003)(8676002)(81156014)(486006)(50226002)(126002)(70206006)(8936002)(476003)(5660300002)(2876002)(70586007)(14444005)(4326008)(2616005)(36756003)(336012)(6916009)(48376002)(50466002)(51416003)(81166006)(26005)(2351001)(2906002)(54906003)(2870700001)(47776003)(356004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0040; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 202b8a30-5552-4f5a-bcf0-08d76205c280
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0040:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB004071ADCB8C6E0DDFFAC276827E0@CY4PR1201MB0040.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0212BDE3BE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ObvlBPZb8YxuGHOI37OEB6SEVsA3nnyoo7ZlVIAGhqRl4UXGipjB56Dn+AKn1IXhKGUefkFEP4ffmbtDc/QjwQjLcPKMhbvdRgdnTpub2lVkbV+VeshjrTMsV1KLTBVcOyhQ9hc9Xs2qheevGuz6r94ks+ifcYzzUFuvHHVzCysaw9P56D/CZ2oaL/r1qHOFWRzojPWq5a7Q6oxOHPdnsqWKs75OwluRX50ZHvglt4Y207bNi9aCuAkdPpCBaOUJHwW/HiRb1dwbx3BhBmmVA0uy3/3lqyravxE1S/sDZwit1UHfanNCGDFKHQjRIaXLp+1KlTxdl4yhaQQws2Sy6qbHAaQgFE7BZWJ7MVQKehLd+VBeWKe6LNAuAPS95GZXYOxQIYTtKaXWlHq/mcx2Ns4g2+nHNo8eScQ6B1nqwyX59HyjREec/YxakLnH3BNs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2019 15:35:17.2839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 202b8a30-5552-4f5a-bcf0-08d76205c280
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0040
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLguO31/rQLAVBq7vE9hMtEzQBiPnDJpj+oS4nZ4wWE=;
 b=B21ySf+xB2InLy0oODLdOq2duI1x0S3mUAKhBWdgKvbjhD0nP290jpvul7MSKo3IjRgPG9ThNNv2j/uD1k0rv3wkxsnJ3rzSt8inFfPwQkQO0cF0m+lHAagK0/nqWrNGzMmmEPkvtDge3CQiW2tYDHYZNH1T+aCcELAYt/ZwmU8=
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
Cc: Leo Li <sunpeng.li@amd.com>, mario.kleiner.de@gmail.com,
 harry.wentland@amd.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpbV2h5XQoKRm9yIERDTiBoYXJkd2Fy
ZSwgdGhlIGNydGNfaGlnaF9pcnEgaGFuZGxlciBpcyBhc3NpZ25lZCB0byB0aGUgdnN0YXJ0dXAK
aW50ZXJydXB0LiBUaGlzIGlzIGRpZmZlcmVudCBmcm9tIERDRSwgd2hpY2ggaGFzIGl0IGFzc2ln
bmVkIHRvIHZibGFuawpzdGFydC4KCldlJ2QgbGlrZSB0byBzZW5kIHZibGFuayBhbmQgdXNlciBl
dmVudHMgYXQgdnN0YXJ0dXAgYmVjYXVzZToKCiogSXQgaGFwcGVucyBjbG9zZSBlbm91Z2ggdG8g
dnVwZGF0ZSAtIHRoZSBwb2ludCBvZiBubyByZXR1cm4gZm9yIEhXLgoKKiBJdCBpcyBwcm9ncmFt
bWVkIGFzIGxpbmVzIHJlbGF0aXZlIHRvIHZibGFuayBlbmQgLSBpLmUuIGl0IGlzIG5vdCBpbgog
IHRoZSB2YXJpYWJsZSBwb3J0aW9uIHdoZW4gVlJSIGlzIGVuYWJsZWQuIFdlIHNob3VsZCBzaWdu
YWwgdXNlcgogIGV2ZW50cyBoZXJlLgoKKiBUaGUgcGZsaXAgaW50ZXJydXB0IHJlc3BvbnNpYmxl
IGZvciBzZW5kaW5nIHVzZXIgZXZlbnRzIHRvZGF5IG9ubHkKICBmaXJlcyBpZiB0aGUgRENIIEhV
QlAgY29tcG9uZW50IGlzIG5vdCBjbG9jayBnYXRlZC4gSW4gc2l0dWF0aW9ucwogIHdoZXJlIHBs
YW5lcyBhcmUgZGlzYWJsZWQgLSBidXQgdGhlIENSVEMgaXMgZW5hYmxlZCAtIHVzZXIgZXZlbnRz
IHdvbid0CiAgYmUgc2VudCBvdXQsIGxlYWRpbmcgdG8gZmxpcCBkb25lIHRpbWVvdXRzLgoKQ29u
c2VxdWVudGx5LCB0aGlzIG1ha2VzIHZ1cGRhdGUgb24gRENOIGhhcmR3YXJlIHJlZHVuZGFudC4g
SXQgd2lsbCBiZQpyZW1vdmVkIGluIHRoZSBuZXh0IGNoYW5nZS4KCltIb3ddCgpBZGQgYSBEQ04t
c3BlY2lmaWMgY3J0Y19oaWdoX2lycSBoYW5kbGVyLCBhbmQgaG9vayBpdCB0byB0aGUgVlN0YXJ0
dXAKc2lnbmFsLiBJbnNpZGUgdGhlIERDTiBoYW5kbGVyLCB3ZSBzZW5kIG9mZiB1c2VyIGV2ZW50
cyBpZiB0aGUgcGZsaXAKaGFuZGxlciBoYXNuJ3QgYWxyZWFkeSBkb25lIHNvLgoKU2lnbmVkLW9m
Zi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNjUgKysrKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAwMDAx
N2I5MWM5MWEuLjI1NmEyM2EwZWMyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC00ODUsNiArNDg1LDY5IEBAIHN0YXRpYyB2
b2lkIGRtX2NydGNfaGlnaF9pcnEodm9pZCAqaW50ZXJydXB0X3BhcmFtcykKIAl9CiB9CgorCisv
KioKKyAqIGRtX2Rjbl9jcnRjX2hpZ2hfaXJxKCkgLSBIYW5kbGVzIFZTdGFydHVwIGludGVycnVw
dCBmb3IgRENOIGdlbmVyYXRpb24gQVNJQ3MKKyAqIEBpbnRlcnJ1cHQgcGFyYW1zIC0gaW50ZXJy
dXB0IHBhcmFtZXRlcnMKKyAqCisgKiBOb3RpZnkgRFJNJ3MgdmJsYW5rIGV2ZW50IGhhbmRsZXIg
YXQgVlNUQVJUVVAKKyAqCisgKiBVbmxpa2UgRENFIGhhcmR3YXJlLCB3ZSB0cmlnZ2VyIHRoZSBo
YW5kbGVyIGF0IFZTVEFSVFVQLiBhdCB3aGljaDoKKyAqICogV2UgYXJlIGNsb3NlIGVub3VnaCB0
byBWVVBEQVRFIC0gdGhlIHBvaW50IG9mIG5vIHJldHVybiBmb3IgaHcKKyAqICogV2UgYXJlIGlu
IHRoZSBmaXhlZCBwb3J0aW9uIG9mIHZhcmlhYmxlIGZyb250IHBvcmNoIHdoZW4gdnJyIGlzIGVu
YWJsZWQKKyAqICogV2UgYXJlIGJlZm9yZSBWVVBEQVRFLCB3aGVyZSBkb3VibGUtYnVmZmVyZWQg
dnJyIHJlZ2lzdGVycyBhcmUgc3dhcHBlZAorICoKKyAqIEl0IGlzIHRoZXJlZm9yZSB0aGUgY29y
cmVjdCBwbGFjZSB0byBzaWduYWwgdmJsYW5rLCBzZW5kIHVzZXIgZmxpcCBldmVudHMsCisgKiBh
bmQgdXBkYXRlIFZSUi4KKyAqLworc3RhdGljIHZvaWQgZG1fZGNuX2NydGNfaGlnaF9pcnEodm9p
ZCAqaW50ZXJydXB0X3BhcmFtcykKK3sKKwlzdHJ1Y3QgY29tbW9uX2lycV9wYXJhbXMgKmlycV9w
YXJhbXMgPSBpbnRlcnJ1cHRfcGFyYW1zOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
aXJxX3BhcmFtcy0+YWRldjsKKwlzdHJ1Y3QgYW1kZ3B1X2NydGMgKmFjcnRjOworCXN0cnVjdCBk
bV9jcnRjX3N0YXRlICphY3J0Y19zdGF0ZTsKKwl1bnNpZ25lZCBsb25nIGZsYWdzOworCisJYWNy
dGMgPSBnZXRfY3J0Y19ieV9vdGdfaW5zdChhZGV2LCBpcnFfcGFyYW1zLT5pcnFfc3JjIC0gSVJR
X1RZUEVfVkJMQU5LKTsKKworCWlmICghYWNydGMpCisJCXJldHVybjsKKworCWFjcnRjX3N0YXRl
ID0gdG9fZG1fY3J0Y19zdGF0ZShhY3J0Yy0+YmFzZS5zdGF0ZSk7CisKKwlEUk1fREVCVUdfRFJJ
VkVSKCJjcnRjOiVkLCB2dXBkYXRlLXZycjolZFxuIiwgYWNydGMtPmNydGNfaWQsCisJCQkJYW1k
Z3B1X2RtX3Zycl9hY3RpdmUoYWNydGNfc3RhdGUpKTsKKworCWFtZGdwdV9kbV9jcnRjX2hhbmRs
ZV9jcmNfaXJxKCZhY3J0Yy0+YmFzZSk7CisJZHJtX2NydGNfaGFuZGxlX3ZibGFuaygmYWNydGMt
PmJhc2UpOworCisJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPmRkZXYtPmV2ZW50X2xvY2ssIGZs
YWdzKTsKKworCWlmIChhY3J0Y19zdGF0ZS0+dnJyX3BhcmFtcy5zdXBwb3J0ZWQgJiYKKwkgICAg
YWNydGNfc3RhdGUtPmZyZWVzeW5jX2NvbmZpZy5zdGF0ZSA9PSBWUlJfU1RBVEVfQUNUSVZFX1ZB
UklBQkxFKSB7CisJCW1vZF9mcmVlc3luY19oYW5kbGVfdl91cGRhdGUoCisJCWFkZXYtPmRtLmZy
ZWVzeW5jX21vZHVsZSwKKwkJYWNydGNfc3RhdGUtPnN0cmVhbSwKKwkJJmFjcnRjX3N0YXRlLT52
cnJfcGFyYW1zKTsKKworCQlkY19zdHJlYW1fYWRqdXN0X3ZtaW5fdm1heCgKKwkJCWFkZXYtPmRt
LmRjLAorCQkJYWNydGNfc3RhdGUtPnN0cmVhbSwKKwkJCSZhY3J0Y19zdGF0ZS0+dnJyX3BhcmFt
cy5hZGp1c3QpOworCX0KKworCWlmIChhY3J0Yy0+cGZsaXBfc3RhdHVzID09IEFNREdQVV9GTElQ
X1NVQk1JVFRFRCkgeworCQlpZiAoYWNydGMtPmV2ZW50KSB7CisJCQlkcm1fY3J0Y19zZW5kX3Zi
bGFua19ldmVudCgmYWNydGMtPmJhc2UsIGFjcnRjLT5ldmVudCk7CisJCQlhY3J0Yy0+ZXZlbnQg
PSBOVUxMOworCQkJZHJtX2NydGNfdmJsYW5rX3B1dCgmYWNydGMtPmJhc2UpOworCQl9CisJCWFj
cnRjLT5wZmxpcF9zdGF0dXMgPSBBTURHUFVfRkxJUF9OT05FOworCX0KKworCXNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJmFkZXYtPmRkZXYtPmV2ZW50X2xvY2ssIGZsYWdzKTsKK30KKwogc3RhdGlj
IGludCBkbV9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLAogCQkgIGVudW0gYW1k
X2Nsb2NrZ2F0aW5nX3N0YXRlIHN0YXRlKQogewpAQCAtMjE3NSw3ICsyMjM4LDcgQEAgc3RhdGlj
IGludCBkY24xMF9yZWdpc3Rlcl9pcnFfaGFuZGxlcnMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJCWNfaXJxX3BhcmFtcy0+aXJxX3NyYyA9IGludF9wYXJhbXMuaXJxX3NvdXJjZTsKCiAJ
CWFtZGdwdV9kbV9pcnFfcmVnaXN0ZXJfaW50ZXJydXB0KGFkZXYsICZpbnRfcGFyYW1zLAotCQkJ
CWRtX2NydGNfaGlnaF9pcnEsIGNfaXJxX3BhcmFtcyk7CisJCQkJZG1fZGNuX2NydGNfaGlnaF9p
cnEsIGNfaXJxX3BhcmFtcyk7CiAJfQoKIAkvKiBVc2UgVlVQREFURV9OT19MT0NLIGludGVycnVw
dCBvbiBEQ04sIHdoaWNoIHNlZW1zIHRvIGNvcnJlc3BvbmQgdG8KLS0KMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
