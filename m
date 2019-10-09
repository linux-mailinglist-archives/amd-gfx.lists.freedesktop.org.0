Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D50FD1A9C
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4AA6EA4C;
	Wed,  9 Oct 2019 21:07:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9452E6EA4C
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:07:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7WKu5LcWY8+i7mHjWZY+krXIHjBs8R6L9Xsv+oFJyFML8A2fL2Yq7o/JVYcAAS6tnAv7londxsrXrNGYkwhomdGVwnB449jVkG9NFExxa/VBajEY9AqMQTiIfRLKNX7tYSPcvZ5rVmEw7kAPl72HOW2WeUQkFqp1jui2HcouShz0TLmgp2hn5kLrGNJE1xEzB7SmCbt61cJr0ttze42wJva9i9QcJYLCBdsteYqjCmBEY8vIl3KZkqVHf9oTX/v4KMXvztCspKCDBpM2Dik2hZHm7j3ppwRnY8Can3vE8o2uYyxJrnezeh3zGE3WoagAJ/Wm7AXtjZZRn44jsYcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI5LNbbphhntNHF+EE8Fr9lCDETVuy7iJ/GZPAD0kF0=;
 b=WrGzdeAHtDnkJY1VMmR42WEvNnNFPzCpY4UbzTT0YF5oSUT5EGRRrijkm5cuVqAwqR9/J3G+WMkmtN2Nlhg8YqU0WiQlmFKUPsg5Gyu30bBTwjqt7dPsAdTib2k8ctUIXdLbgQgPnGmlRJxhExszh89Cjd5KGlRHu52X9wBlvz6MkVFuLBTGmlL96ykd2Zd5ij2b7532S9aHXPuwiENaWWPyNdVIBu6nkfAwAMiOfEwbsGuFLk+gGt1ZX+hktGpaefRq/5lRLxhauqx8rew4VFqTMLRsTQE4A6bNXYAh5FdkkQP404k0kIDmp2F7tpr4+9gwLybHmB/rOgbDNZMdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0029.namprd12.prod.outlook.com (2603:10b6:5:1c0::42)
 by SN6PR12MB2654.namprd12.prod.outlook.com (2603:10b6:805:6f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 21:06:30 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM6PR12CA0029.outlook.office365.com
 (2603:10b6:5:1c0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.17 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:30 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:30 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:30 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 23/26] drm/amd/display: add sanity check for clk table from smu
Date: Wed, 9 Oct 2019 17:06:10 -0400
Message-ID: <20191009210613.17929-24-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(428003)(189003)(199004)(54906003)(50466002)(126002)(2616005)(4326008)(16586007)(476003)(2351001)(11346002)(336012)(486006)(51416003)(48376002)(47776003)(26005)(446003)(70206006)(70586007)(186003)(36756003)(7696005)(76176011)(14444005)(426003)(8936002)(86362001)(8676002)(81166006)(81156014)(6916009)(5660300002)(316002)(305945005)(50226002)(2906002)(478600001)(6666004)(356004)(53416004)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2654; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1b3223a-9f85-45a2-2694-08d74cfc8ea0
X-MS-TrafficTypeDiagnostic: SN6PR12MB2654:
X-Microsoft-Antispam-PRVS: <SN6PR12MB26542C2EDB30B2214E000F47F9950@SN6PR12MB2654.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r0TjrzVy9XBmK7ulmXpBHRO1h7yOKO9Rw3rjkZYzq2dP3QUVHd7jBekt1zSzMB+TYNlH5NUC0GHfvKkr5Us2iaPfXP7QK1EpeX8FdEkzfAsCwg6CrYKeAgFhUp4L4rEJSmwe9cVsGArLJP6CrJYXRE3cWjtbl07CvWlRV22NxHkbgUAVUrQXGDl18+eVNyp9Cv5qKwZ4/9GZcVErkLAK6RxS0IkA4oLfxGyhEbyAOnFgAD6t98XqnPsUSzf2WNwOhtEn5Ywwj67g3DbeeVV9fgzQv69h2AQPDfJB+uRzUg/U1XWtZ9RhNA67Df9biWdHz6Rh67Vfl4FwlE3pDrX5K4oYdhQd2iSJnTFxM2JnmDgmHa8KBTXd7q2tmMIo0JGkSTMEWwMT5D2tK8/JVPAKePbsNiOF3Ygc7h8v4x49A+E=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:30.3193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b3223a-9f85-45a2-2694-08d74cfc8ea0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2654
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI5LNbbphhntNHF+EE8Fr9lCDETVuy7iJ/GZPAD0kF0=;
 b=Pn5Qqkz3X3gTOOKGL2LIW04xRQdfaFTU7OV8XzeDLeUtkCDAEFDN3wldFlbhqaAoIOOJmWwyfo9jZaMvMrQcXuBnbYrH5JiaP5n/3McS3lMrMg2pp6HQFs7oEA82ewwxKGIeaOMAbiFaZm3j2U6Y3uCZjPMmvNxLGqlp2Ru+sWo=
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
Cc: sunpeng.li@amd.com, harry.wentland@amd.com, Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpIYW5kbGUgdGhlIGNh
c2Ugd2hlcmUgd2UgZG9uJ3QgZ2V0IGEgdmFsaWQgdGFibGUuIEFsc28gZml4ZXMgY29tcGlsZXIK
d2FybmluZyBmb3IgdmFyaWFibGUgcG90ZW50aWFsbHkgdXNlZCBiZWZvcmUgYXNzaWdubWVudC4K
CltIb3ddCklmIHRoZSBlbnRpcmUgdGFibGUgaGFzIG5vIHZhbGlkIGZjbGssIHJlamVjdCB0aGUg
dGFibGUgYW5kIHVzZSBvdXIgb3duCmhhcmQgY29kZS4KClNpZ25lZC1vZmYtYnk6IEVyaWMgWWFu
ZyA8RXJpYy5ZYW5nMkBhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdh
bnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYwppbmRleCBmYjhhYTk0MzZiZjAuLjBl
NzEyZGY4NzEwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Ns
a19tZ3IvZGNuMjEvcm5fY2xrX21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYwpAQCAtNTQ2LDYgKzU0Niw4IEBAIHZvaWQg
cm5fY2xrX21ncl9oZWxwZXJfcG9wdWxhdGVfYndfcGFyYW1zKHN0cnVjdCBjbGtfYndfcGFyYW1z
ICpid19wYXJhbXMsIHN0cnVjCiB7CiAJaW50IGksIGogPSAwOwogCisJaiA9IC0xOworCiAJQVNT
RVJUKFBQX1NNVV9OVU1fRkNMS19EUE1fTEVWRUxTIDw9IE1BWF9OVU1fRFBNX0xWTCk7CiAKIAkv
KiBGaW5kIGxvd2VzdCBEUE0sIEZDTEsgaXMgZmlsbGVkIGluIHJldmVyc2Ugb3JkZXIqLwpAQCAt
NTU3LDYgKzU1OSwxMiBAQCB2b2lkIHJuX2Nsa19tZ3JfaGVscGVyX3BvcHVsYXRlX2J3X3BhcmFt
cyhzdHJ1Y3QgY2xrX2J3X3BhcmFtcyAqYndfcGFyYW1zLCBzdHJ1YwogCQl9CiAJfQogCisJaWYg
KGogPT0gLTEpIHsKKwkJLyogY2xvY2sgdGFibGUgaXMgYWxsIDBzLCBqdXN0IHVzZSBvdXIgb3du
IGhhcmRjb2RlICovCisJCUFTU0VSVCgwKTsKKwkJcmV0dXJuOworCX0KKwogCWJ3X3BhcmFtcy0+
Y2xrX3RhYmxlLm51bV9lbnRyaWVzID0gaiArIDE7CiAKIAlmb3IgKGkgPSAwOyBpIDwgYndfcGFy
YW1zLT5jbGtfdGFibGUubnVtX2VudHJpZXM7IGkrKywgai0tKSB7Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
