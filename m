Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8861FA20C6
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090C56E13D;
	Thu, 29 Aug 2019 16:24:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780078.outbound.protection.outlook.com [40.107.78.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3008A6E134
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:24:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tcl5zKViHMqozg1JQdt4Q/hT9bpYsnF3LXIyiKBAR873mq32e2hLvGKbGP+YnSpTeGH9GP4ugHRU1uOzXlYQIBqT4xFBUeefgrwi8IdX8ih02C+AoUVOCOxNHKRj6OAjtv84MNbwhlex+lB83ekZPmA9brXQdQOYwxQ4e4Wv6TQUgXp+Z255Wm8usNk4hVz0mEmqlZl3oozc2acRHa0h83TlGEzwcFIJZ46I9sc2hG2OzVSBM51KyJOPlHto8s9AiQt4+WxX/o+5QM0LY5Z8ZbYHJbAEZ+DfG4vDMqh116K72RQls3ha/c3ze1MhCVh8txnC03LgZJTYwURKCV0vIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htk5X1ImjoIeJygQ/ScbVJdwbEKe9JZl3DeSZ+UZ6dg=;
 b=ions0j2Zjt3SQ0w4qK8I28QmXhSxP3JdEZRCXHyijFdqwkehqdA4SbElLaAsW4eh3rAw6MqdMJiQdjV5Ad5/b48GBcUgaETo5fu7qE6SnhItnp0RxJ2iayAOthHLMaDOgTPqxtmNmK8w5SsR0+DaOGiXXJlOGiaiJFeFJvrgKg4zcS1o1n6zCY9zY31PNYkaGORmwfZ7nqN4uxpjPFjuy221uvW2j/KdLtNyTB4+9yDoi2/TH/od9wm52SPoRkadrOgnX6acJOpd0BII2P91wsJy4o8LwW7hyLoVLR4qziO/+5tPWHeyAMI0yVM8Phmjcn1Zc60AhWKkA+NlqGRGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (2603:10b6:403:2::19)
 by SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:70::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Thu, 29 Aug
 2019 16:24:02 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::200) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.17 via Frontend
 Transport; Thu, 29 Aug 2019 16:24:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 16:24:02 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 11:23:46 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/20] drm/amd/display: add PSP block to verify hdcp steps
Date: Thu, 29 Aug 2019 12:22:44 -0400
Message-ID: <20190829162253.10195-12-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(81166006)(53936002)(15650500001)(5660300002)(30864003)(2351001)(1076003)(2906002)(53416004)(356004)(36756003)(478600001)(8676002)(50226002)(6916009)(50466002)(316002)(48376002)(81156014)(70586007)(16586007)(70206006)(8936002)(47776003)(426003)(336012)(51416003)(76176011)(7696005)(2616005)(446003)(14444005)(11346002)(486006)(26005)(86362001)(4326008)(126002)(476003)(186003)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2717; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95495f97-eadc-4e82-cc83-08d72c9d4dc0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:SN6PR12MB2717; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2717:
X-Microsoft-Antispam-PRVS: <SN6PR12MB271701E060AB071DE80852E6F9A20@SN6PR12MB2717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 9aeqpX0kpUImjOZoV1R881Ta19+krt6eUgK9E62XuZVDdQqV33fMRnb45+So1gwCpHtbadlqoo0q/pI10SWrgOUyJ3PNuwxoC0SRjkaL5J8i8PzZ9XcjNQAIFWmsVsspxvEYYY81pdfboHD6r0mUzc/nOO32xjGClUcthcyax3gsOMtjjZj+ovZadHXN1NmpEZgRlNJW6lDSip5enfuqqvqaLvnw5REsRjFME1kjQ/z+0leDERc5SxCynQVkWHYma/e0ISNxTxFAdFzpTZMQ8qn6ojaoC7niFoTGJiIxLhXD8RprbCVWV/SajKUvHh6pYP3tovuXWHxrKVItuEtx3qyvS8L1OAOTqNHWZmCTI/Dk19DzdEAavArLxnXqt+q9HIIe3Kd19lQcE/4eI12T/yNXJycsLggyENF69MRW5Hg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 16:24:02.0611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95495f97-eadc-4e82-cc83-08d72c9d4dc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2717
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htk5X1ImjoIeJygQ/ScbVJdwbEKe9JZl3DeSZ+UZ6dg=;
 b=FGAcLiUaev/hr4ASWIuNApsRM7b16aLa9X8vaLZcQY8oyl+92xi14Anf3EfGvlWgM84c6fGJy5bPjtnvWos1w5J5KDdRYM5fUcoS0HPBQDeo0dXDi3q0cDSOqQqbEtLwfdcyyE3NBz5oj1Y52cVWI9O00wsWMt6vKNHuHl/XoN8=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KQWxsIHRoZSBIRENQIHRyYW5zYWN0aW9ucyBzaG91bGQgYmUgdmVyaWZpZWQgdXNpbmcg
UFNQLgoKW0hvd10KVGhpcyBwYXRjaCBjYWxscyBwc3Agd2l0aCB0aGUgY29ycmVjdCBpbnB1dHMg
dG8gdmVyaWZ5IHRoZSBzdGVwcwpvZiBhdXRoZW50aWNhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEJo
YXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0v
YW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmMgICB8IDMyOCArKysrKysrKysrKysr
KysrKysKIC4uLi9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmggICB8IDI3
MiArKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNjAwIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNw
L2hkY3BfcHNwLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmgKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi42NDZkOTA5YmJjMzcKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3BfcHNwLmMKQEAgLTAsMCArMSwz
MjggQEAKKy8qCisgKiBDb3B5cmlnaHQgMjAxOCBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMu
CisgKgorICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRv
IGFueSBwZXJzb24gb2J0YWluaW5nIGEKKyAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNz
b2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksCisgKiB0byBkZWFs
IGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBs
aW1pdGF0aW9uCisgKiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVi
bGlzaCwgZGlzdHJpYnV0ZSwgc3VibGljZW5zZSwKKyAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0
aGUgU29mdHdhcmUsIGFuZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZQorICogU29mdHdh
cmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0
aW9uczoKKyAqCisgKiBUaGUgYWJvdmUgY29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNz
aW9uIG5vdGljZSBzaGFsbCBiZSBpbmNsdWRlZCBpbgorICogYWxsIGNvcGllcyBvciBzdWJzdGFu
dGlhbCBwb3J0aW9ucyBvZiB0aGUgU29mdHdhcmUuCisgKgorICogVEhFIFNPRlRXQVJFIElTIFBS
T1ZJREVEICJBUyBJUyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IK
KyAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMg
T0YgTUVSQ0hBTlRBQklMSVRZLAorICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0Ug
QU5EIE5PTklORlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMCisgKiBUSEUgQ09QWVJJR0hU
IEhPTERFUihTKSBPUiBBVVRIT1IoUykgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMg
T1IKKyAqIE9USEVSIExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1Qs
IFRPUlQgT1IgT1RIRVJXSVNFLAorICogQVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVD
VElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SCisgKiBPVEhFUiBERUFMSU5HUyBJ
TiBUSEUgU09GVFdBUkUuCisgKgorICogQXV0aG9yczogQU1ECisgKgorICovCisKKyNkZWZpbmUg
TUFYX05VTV9ESVNQTEFZUyAyNAorCisKKyNpbmNsdWRlICJoZGNwLmgiCisKKyNpbmNsdWRlICJh
bWRncHUuaCIKKyNpbmNsdWRlICJoZGNwX3BzcC5oIgorCitlbnVtIG1vZF9oZGNwX3N0YXR1cyBt
b2RfaGRjcF9yZW1vdmVfZGlzcGxheV90b3BvbG9neShzdHJ1Y3QgbW9kX2hkY3AgKmhkY3ApCit7
CisKKwlzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCA9IGhkY3AtPmNvbmZpZy5wc3AuaGFuZGxlOwor
CXN0cnVjdCB0YV9kdG1fc2hhcmVkX21lbW9yeSAqZHRtX2NtZDsKKwlzdHJ1Y3QgbW9kX2hkY3Bf
ZGlzcGxheSAqZGlzcGxheSA9IE5VTEw7CisJdWludDhfdCBpOworCisJZHRtX2NtZCA9IChzdHJ1
Y3QgdGFfZHRtX3NoYXJlZF9tZW1vcnkgKilwc3AtPmR0bV9jb250ZXh0LmR0bV9zaGFyZWRfYnVm
OworCisJZm9yIChpID0gMDsgaSA8IE1BWF9OVU1fT0ZfRElTUExBWVM7IGkrKykgeworCQlpZiAo
aGRjcC0+Y29ubmVjdGlvbi5kaXNwbGF5c1tpXS5zdGF0ZSA9PSBNT0RfSERDUF9ESVNQTEFZX0FD
VElWRV9BTkRfQURERUQpIHsKKworCQkJbWVtc2V0KGR0bV9jbWQsIDAsIHNpemVvZihzdHJ1Y3Qg
dGFfZHRtX3NoYXJlZF9tZW1vcnkpKTsKKworCQkJZGlzcGxheSA9ICZoZGNwLT5jb25uZWN0aW9u
LmRpc3BsYXlzW2ldOworCisJCQlkdG1fY21kLT5jbWRfaWQgPSBUQV9EVE1fQ09NTUFORF9fVE9Q
T0xPR1lfVVBEQVRFX1YyOworCQkJZHRtX2NtZC0+ZHRtX2luX21lc3NhZ2UudG9wb2xvZ3lfdXBk
YXRlX3YyLmRpc3BsYXlfaGFuZGxlID0gZGlzcGxheS0+aW5kZXg7CisJCQlkdG1fY21kLT5kdG1f
aW5fbWVzc2FnZS50b3BvbG9neV91cGRhdGVfdjIuaXNfYWN0aXZlID0gMDsKKwkJCWR0bV9jbWQt
PmR0bV9zdGF0dXMgPSBUQV9EVE1fU1RBVFVTX19HRU5FUklDX0ZBSUxVUkU7CisKKwkJCXBzcF9k
dG1faW52b2tlKHBzcCwgZHRtX2NtZC0+Y21kX2lkKTsKKworCQkJaWYgKGR0bV9jbWQtPmR0bV9z
dGF0dXMgIT0gVEFfRFRNX1NUQVRVU19fU1VDQ0VTUykKKwkJCQlyZXR1cm4gTU9EX0hEQ1BfU1RB
VFVTX1VQREFURV9UT1BPTE9HWV9GQUlMVVJFOworCisJCQlkaXNwbGF5LT5zdGF0ZSA9IE1PRF9I
RENQX0RJU1BMQVlfQUNUSVZFOworCQkJSERDUF9UT1BfUkVNT1ZFX0RJU1BMQVlfVFJBQ0UoaGRj
cCwgZGlzcGxheS0+aW5kZXgpOworCQl9CisJfQorCisJcmV0dXJuIE1PRF9IRENQX1NUQVRVU19T
VUNDRVNTOworfQorCitlbnVtIG1vZF9oZGNwX3N0YXR1cyBtb2RfaGRjcF9hZGRfZGlzcGxheV90
b3BvbG9neShzdHJ1Y3QgbW9kX2hkY3AgKmhkY3ApCit7CisJc3RydWN0IHBzcF9jb250ZXh0ICpw
c3AgPSBoZGNwLT5jb25maWcucHNwLmhhbmRsZTsKKwlzdHJ1Y3QgdGFfZHRtX3NoYXJlZF9tZW1v
cnkgKmR0bV9jbWQ7CisJc3RydWN0IG1vZF9oZGNwX2Rpc3BsYXkgKmRpc3BsYXkgPSBOVUxMOwor
CXN0cnVjdCBtb2RfaGRjcF9saW5rICpsaW5rID0gJmhkY3AtPmNvbm5lY3Rpb24ubGluazsKKwl1
aW50OF90IGk7CisKKwlpZiAoIXBzcC0+ZHRtX2NvbnRleHQuZHRtX2luaXRpYWxpemVkKSB7CisJ
CURSTV9FUlJPUigiRmFpbGVkIHRvIGFkZCBkaXNwbGF5IHRvcG9sb2d5LCBEVE0gVEEgaXMgbm90
IGluaXRpYWxpemVkLiIpOworCQlyZXR1cm4gTU9EX0hEQ1BfU1RBVFVTX0ZBSUxVUkU7CisJfQor
CisJZHRtX2NtZCA9IChzdHJ1Y3QgdGFfZHRtX3NoYXJlZF9tZW1vcnkgKilwc3AtPmR0bV9jb250
ZXh0LmR0bV9zaGFyZWRfYnVmOworCisJZm9yIChpID0gMDsgaSA8IE1BWF9OVU1fT0ZfRElTUExB
WVM7IGkrKykgeworCQlpZiAoaGRjcC0+Y29ubmVjdGlvbi5kaXNwbGF5c1tpXS5zdGF0ZSA9PSBN
T0RfSERDUF9ESVNQTEFZX0FDVElWRSkgeworCQkJZGlzcGxheSA9ICZoZGNwLT5jb25uZWN0aW9u
LmRpc3BsYXlzW2ldOworCisJCQltZW1zZXQoZHRtX2NtZCwgMCwgc2l6ZW9mKHN0cnVjdCB0YV9k
dG1fc2hhcmVkX21lbW9yeSkpOworCisJCQlkdG1fY21kLT5jbWRfaWQgPSBUQV9EVE1fQ09NTUFO
RF9fVE9QT0xPR1lfVVBEQVRFX1YyOworCQkJZHRtX2NtZC0+ZHRtX2luX21lc3NhZ2UudG9wb2xv
Z3lfdXBkYXRlX3YyLmRpc3BsYXlfaGFuZGxlID0gZGlzcGxheS0+aW5kZXg7CisJCQlkdG1fY21k
LT5kdG1faW5fbWVzc2FnZS50b3BvbG9neV91cGRhdGVfdjIuaXNfYWN0aXZlID0gMTsKKwkJCWR0
bV9jbWQtPmR0bV9pbl9tZXNzYWdlLnRvcG9sb2d5X3VwZGF0ZV92Mi5jb250cm9sbGVyID0gZGlz
cGxheS0+Y29udHJvbGxlcjsKKwkJCWR0bV9jbWQtPmR0bV9pbl9tZXNzYWdlLnRvcG9sb2d5X3Vw
ZGF0ZV92Mi5kZGNfbGluZSA9IGxpbmstPmRkY19saW5lOworCQkJZHRtX2NtZC0+ZHRtX2luX21l
c3NhZ2UudG9wb2xvZ3lfdXBkYXRlX3YyLmRpZ19iZSA9IGxpbmstPmRpZ19iZTsKKwkJCWR0bV9j
bWQtPmR0bV9pbl9tZXNzYWdlLnRvcG9sb2d5X3VwZGF0ZV92Mi5kaWdfZmUgPSBkaXNwbGF5LT5k
aWdfZmU7CisJCQlkdG1fY21kLT5kdG1faW5fbWVzc2FnZS50b3BvbG9neV91cGRhdGVfdjIuZHBf
bXN0X3ZjaWQgPSBkaXNwbGF5LT52Y19pZDsKKwkJCWR0bV9jbWQtPmR0bV9pbl9tZXNzYWdlLnRv
cG9sb2d5X3VwZGF0ZV92Mi5tYXhfaGRjcF9zdXBwb3J0ZWRfdmVyc2lvbiA9CisJCQkJVEFfRFRN
X0hEQ1BfVkVSU0lPTl9NQVhfU1VQUE9SVEVEX18xX3g7CisJCQlkdG1fY21kLT5kdG1fc3RhdHVz
ID0gVEFfRFRNX1NUQVRVU19fR0VORVJJQ19GQUlMVVJFOworCisJCQlwc3BfZHRtX2ludm9rZShw
c3AsIGR0bV9jbWQtPmNtZF9pZCk7CisKKwkJCWlmIChkdG1fY21kLT5kdG1fc3RhdHVzICE9IFRB
X0RUTV9TVEFUVVNfX1NVQ0NFU1MpCisJCQkJcmV0dXJuIE1PRF9IRENQX1NUQVRVU19VUERBVEVf
VE9QT0xPR1lfRkFJTFVSRTsKKworCQkJZGlzcGxheS0+c3RhdGUgPSBNT0RfSERDUF9ESVNQTEFZ
X0FDVElWRV9BTkRfQURERUQ7CisJCQlIRENQX1RPUF9BRERfRElTUExBWV9UUkFDRShoZGNwLCBk
aXNwbGF5LT5pbmRleCk7CisJCX0KKwl9CisKKwlyZXR1cm4gTU9EX0hEQ1BfU1RBVFVTX1NVQ0NF
U1M7Cit9CisKK2VudW0gbW9kX2hkY3Bfc3RhdHVzIG1vZF9oZGNwX2hkY3AxX2NyZWF0ZV9zZXNz
aW9uKHN0cnVjdCBtb2RfaGRjcCAqaGRjcCkKK3sKKworCXN0cnVjdCBwc3BfY29udGV4dCAqcHNw
ID0gaGRjcC0+Y29uZmlnLnBzcC5oYW5kbGU7CisJc3RydWN0IG1vZF9oZGNwX2Rpc3BsYXkgKmRp
c3BsYXkgPSBnZXRfZmlyc3RfYWRkZWRfZGlzcGxheShoZGNwKTsKKwlzdHJ1Y3QgdGFfaGRjcF9z
aGFyZWRfbWVtb3J5ICpoZGNwX2NtZDsKKworCWlmICghcHNwLT5oZGNwX2NvbnRleHQuaGRjcF9p
bml0aWFsaXplZCkgeworCQlEUk1fRVJST1IoIkZhaWxlZCB0byBjcmVhdGUgaGRjcCBzZXNzaW9u
LiBIRENQIFRBIGlzIG5vdCBpbml0aWFsaXplZC4iKTsKKwkJcmV0dXJuIE1PRF9IRENQX1NUQVRV
U19GQUlMVVJFOworCX0KKworCWhkY3BfY21kID0gKHN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1v
cnkgKilwc3AtPmhkY3BfY29udGV4dC5oZGNwX3NoYXJlZF9idWY7CisJbWVtc2V0KGhkY3BfY21k
LCAwLCBzaXplb2Yoc3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSkpOworCisJaGRjcF9jbWQt
PmluX21zZy5oZGNwMV9jcmVhdGVfc2Vzc2lvbi5kaXNwbGF5X2hhbmRsZSA9IGRpc3BsYXktPmlu
ZGV4OworCWhkY3BfY21kLT5jbWRfaWQgPSBUQV9IRENQX0NPTU1BTkRfX0hEQ1AxX0NSRUFURV9T
RVNTSU9OOworCisJcHNwX2hkY3BfaW52b2tlKHBzcCwgaGRjcF9jbWQtPmNtZF9pZCk7CisKKwlp
ZiAoaGRjcF9jbWQtPmhkY3Bfc3RhdHVzICE9IFRBX0hEQ1BfU1RBVFVTX19TVUNDRVNTKQorCQly
ZXR1cm4gTU9EX0hEQ1BfU1RBVFVTX0hEQ1AxX0NSRUFURV9TRVNTSU9OX0ZBSUxVUkU7CisKKwlo
ZGNwLT5hdXRoLmlkID0gaGRjcF9jbWQtPm91dF9tc2cuaGRjcDFfY3JlYXRlX3Nlc3Npb24uc2Vz
c2lvbl9oYW5kbGU7CisJaGRjcC0+YXV0aC5tc2cuaGRjcDEuYWluZm8gPSBoZGNwX2NtZC0+b3V0
X21zZy5oZGNwMV9jcmVhdGVfc2Vzc2lvbi5haW5mb19wcmltYXJ5OworCW1lbWNweShoZGNwLT5h
dXRoLm1zZy5oZGNwMS5ha3N2LCBoZGNwX2NtZC0+b3V0X21zZy5oZGNwMV9jcmVhdGVfc2Vzc2lv
bi5ha3N2X3ByaW1hcnksCisJCXNpemVvZihoZGNwLT5hdXRoLm1zZy5oZGNwMS5ha3N2KSk7CisJ
bWVtY3B5KGhkY3AtPmF1dGgubXNnLmhkY3AxLmFuLCBoZGNwX2NtZC0+b3V0X21zZy5oZGNwMV9j
cmVhdGVfc2Vzc2lvbi5hbl9wcmltYXJ5LAorCQlzaXplb2YoaGRjcC0+YXV0aC5tc2cuaGRjcDEu
YW4pKTsKKworCXJldHVybiBNT0RfSERDUF9TVEFUVVNfU1VDQ0VTUzsKK30KKworZW51bSBtb2Rf
aGRjcF9zdGF0dXMgbW9kX2hkY3BfaGRjcDFfZGVzdHJveV9zZXNzaW9uKHN0cnVjdCBtb2RfaGRj
cCAqaGRjcCkKK3sKKworCXN0cnVjdCBwc3BfY29udGV4dCAqcHNwID0gaGRjcC0+Y29uZmlnLnBz
cC5oYW5kbGU7CisJc3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSAqaGRjcF9jbWQ7CisKKwlo
ZGNwX2NtZCA9IChzdHJ1Y3QgdGFfaGRjcF9zaGFyZWRfbWVtb3J5ICopcHNwLT5oZGNwX2NvbnRl
eHQuaGRjcF9zaGFyZWRfYnVmOworCW1lbXNldChoZGNwX2NtZCwgMCwgc2l6ZW9mKHN0cnVjdCB0
YV9oZGNwX3NoYXJlZF9tZW1vcnkpKTsKKworCWhkY3BfY21kLT5pbl9tc2cuaGRjcDFfZGVzdHJv
eV9zZXNzaW9uLnNlc3Npb25faGFuZGxlID0gaGRjcC0+YXV0aC5pZDsKKwloZGNwX2NtZC0+Y21k
X2lkID0gVEFfSERDUF9DT01NQU5EX19IRENQMV9ERVNUUk9ZX1NFU1NJT047CisKKwlwc3BfaGRj
cF9pbnZva2UocHNwLCBoZGNwX2NtZC0+Y21kX2lkKTsKKworCWlmIChoZGNwX2NtZC0+aGRjcF9z
dGF0dXMgIT0gVEFfSERDUF9TVEFUVVNfX1NVQ0NFU1MpCisJCXJldHVybiBNT0RfSERDUF9TVEFU
VVNfSERDUDFfREVTVFJPWV9TRVNTSU9OX0ZBSUxVUkU7CisKKwlIRENQX1RPUF9IRENQMV9ERVNU
Uk9ZX1NFU1NJT05fVFJBQ0UoaGRjcCk7CisKKwlyZXR1cm4gTU9EX0hEQ1BfU1RBVFVTX1NVQ0NF
U1M7Cit9CisKK2VudW0gbW9kX2hkY3Bfc3RhdHVzIG1vZF9oZGNwX2hkY3AxX3ZhbGlkYXRlX3J4
KHN0cnVjdCBtb2RfaGRjcCAqaGRjcCkKK3sKKwlzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCA9IGhk
Y3AtPmNvbmZpZy5wc3AuaGFuZGxlOworCXN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkgKmhk
Y3BfY21kOworCisJaGRjcF9jbWQgPSAoc3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSAqKXBz
cC0+aGRjcF9jb250ZXh0LmhkY3Bfc2hhcmVkX2J1ZjsKKwltZW1zZXQoaGRjcF9jbWQsIDAsIHNp
emVvZihzdHJ1Y3QgdGFfaGRjcF9zaGFyZWRfbWVtb3J5KSk7CisKKwloZGNwX2NtZC0+aW5fbXNn
LmhkY3AxX2ZpcnN0X3BhcnRfYXV0aGVudGljYXRpb24uc2Vzc2lvbl9oYW5kbGUgPSBoZGNwLT5h
dXRoLmlkOworCisJbWVtY3B5KGhkY3BfY21kLT5pbl9tc2cuaGRjcDFfZmlyc3RfcGFydF9hdXRo
ZW50aWNhdGlvbi5ia3N2X3ByaW1hcnksIGhkY3AtPmF1dGgubXNnLmhkY3AxLmJrc3YsCisJCVRB
X0hEQ1BfX0hEQ1AxX0tTVl9TSVpFKTsKKworCWhkY3BfY21kLT5pbl9tc2cuaGRjcDFfZmlyc3Rf
cGFydF9hdXRoZW50aWNhdGlvbi5yMF9wcmltZV9wcmltYXJ5ID0gaGRjcC0+YXV0aC5tc2cuaGRj
cDEucjBwOworCWhkY3BfY21kLT5pbl9tc2cuaGRjcDFfZmlyc3RfcGFydF9hdXRoZW50aWNhdGlv
bi5iY2FwcyA9IGhkY3AtPmF1dGgubXNnLmhkY3AxLmJjYXBzOworCWhkY3BfY21kLT5jbWRfaWQg
PSBUQV9IRENQX0NPTU1BTkRfX0hEQ1AxX0ZJUlNUX1BBUlRfQVVUSEVOVElDQVRJT047CisKKwlw
c3BfaGRjcF9pbnZva2UocHNwLCBoZGNwX2NtZC0+Y21kX2lkKTsKKworCWlmIChoZGNwX2NtZC0+
aGRjcF9zdGF0dXMgIT0gVEFfSERDUF9TVEFUVVNfX1NVQ0NFU1MpCisJCXJldHVybiBNT0RfSERD
UF9TVEFUVVNfSERDUDFfVkFMSURBVEVfUlhfRkFJTFVSRTsKKworCWlmIChoZGNwX2NtZC0+b3V0
X21zZy5oZGNwMV9maXJzdF9wYXJ0X2F1dGhlbnRpY2F0aW9uLmF1dGhlbnRpY2F0aW9uX3N0YXR1
cyA9PQorCSAgICBUQV9IRENQX0FVVEhFTlRJQ0FUSU9OX1NUQVRVU19fSERDUDFfRklSU1RfUEFS
VF9DT01QTEVURSkgeworCQkvKiBuZWVkcyBzZWNvbmQgcGFydCBvZiBhdXRoZW50aWNhdGlvbiAq
LworCQloZGNwLT5jb25uZWN0aW9uLmlzX3JlcGVhdGVyID0gMTsKKwl9IGVsc2UgaWYgKGhkY3Bf
Y21kLT5vdXRfbXNnLmhkY3AxX2ZpcnN0X3BhcnRfYXV0aGVudGljYXRpb24uYXV0aGVudGljYXRp
b25fc3RhdHVzID09CisJCSAgIFRBX0hEQ1BfQVVUSEVOVElDQVRJT05fU1RBVFVTX19IRENQMV9B
VVRIRU5USUNBVEVEKSB7CisJCWhkY3AtPmNvbm5lY3Rpb24uaXNfcmVwZWF0ZXIgPSAwOworCX0g
ZWxzZQorCQlyZXR1cm4gTU9EX0hEQ1BfU1RBVFVTX0hEQ1AxX1ZBTElEQVRFX1JYX0ZBSUxVUkU7
CisKKworCXJldHVybiBNT0RfSERDUF9TVEFUVVNfU1VDQ0VTUzsKK30KKworZW51bSBtb2RfaGRj
cF9zdGF0dXMgbW9kX2hkY3BfaGRjcDFfZW5hYmxlX2VuY3J5cHRpb24oc3RydWN0IG1vZF9oZGNw
ICpoZGNwKQoreworCXN0cnVjdCBwc3BfY29udGV4dCAqcHNwID0gaGRjcC0+Y29uZmlnLnBzcC5o
YW5kbGU7CisJc3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSAqaGRjcF9jbWQ7CisJc3RydWN0
IG1vZF9oZGNwX2Rpc3BsYXkgKmRpc3BsYXkgPSBnZXRfZmlyc3RfYWRkZWRfZGlzcGxheShoZGNw
KTsKKworCWhkY3BfY21kID0gKHN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkgKilwc3AtPmhk
Y3BfY29udGV4dC5oZGNwX3NoYXJlZF9idWY7CisJbWVtc2V0KGhkY3BfY21kLCAwLCBzaXplb2Yo
c3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSkpOworCisJaGRjcF9jbWQtPmluX21zZy5oZGNw
MV9lbmFibGVfZW5jcnlwdGlvbi5zZXNzaW9uX2hhbmRsZSA9IGhkY3AtPmF1dGguaWQ7CisJaGRj
cF9jbWQtPmNtZF9pZCA9IFRBX0hEQ1BfQ09NTUFORF9fSERDUDFfRU5BQkxFX0VOQ1JZUFRJT047
CisKKwlwc3BfaGRjcF9pbnZva2UocHNwLCBoZGNwX2NtZC0+Y21kX2lkKTsKKworCWlmIChoZGNw
X2NtZC0+aGRjcF9zdGF0dXMgIT0gVEFfSERDUF9TVEFUVVNfX1NVQ0NFU1MpCisJCXJldHVybiBN
T0RfSERDUF9TVEFUVVNfSERDUDFfRU5BQkxFX0VOQ1JZUFRJT047CisKKwlpZiAoIWlzX2RwX21z
dF9oZGNwKGhkY3ApKSB7CisJCWRpc3BsYXktPnN0YXRlID0gTU9EX0hEQ1BfRElTUExBWV9FTkNS
WVBUSU9OX0VOQUJMRUQ7CisJCUhEQ1BfSERDUDFfRU5BQkxFRF9UUkFDRShoZGNwLCBkaXNwbGF5
LT5pbmRleCk7CisJfQorCXJldHVybiBNT0RfSERDUF9TVEFUVVNfU1VDQ0VTUzsKK30KKworZW51
bSBtb2RfaGRjcF9zdGF0dXMgbW9kX2hkY3BfaGRjcDFfdmFsaWRhdGVfa3N2bGlzdF92cChzdHJ1
Y3QgbW9kX2hkY3AgKmhkY3ApCit7CisJc3RydWN0IHBzcF9jb250ZXh0ICpwc3AgPSBoZGNwLT5j
b25maWcucHNwLmhhbmRsZTsKKwlzdHJ1Y3QgdGFfaGRjcF9zaGFyZWRfbWVtb3J5ICpoZGNwX2Nt
ZDsKKworCWhkY3BfY21kID0gKHN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkgKilwc3AtPmhk
Y3BfY29udGV4dC5oZGNwX3NoYXJlZF9idWY7CisJbWVtc2V0KGhkY3BfY21kLCAwLCBzaXplb2Yo
c3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSkpOworCisJaGRjcF9jbWQtPmluX21zZy5oZGNw
MV9zZWNvbmRfcGFydF9hdXRoZW50aWNhdGlvbi5zZXNzaW9uX2hhbmRsZSA9IGhkY3AtPmF1dGgu
aWQ7CisKKwloZGNwX2NtZC0+aW5fbXNnLmhkY3AxX3NlY29uZF9wYXJ0X2F1dGhlbnRpY2F0aW9u
Lmtzdl9saXN0X3NpemUgPSBoZGNwLT5hdXRoLm1zZy5oZGNwMS5rc3ZsaXN0X3NpemU7CisJbWVt
Y3B5KGhkY3BfY21kLT5pbl9tc2cuaGRjcDFfc2Vjb25kX3BhcnRfYXV0aGVudGljYXRpb24ua3N2
X2xpc3QsIGhkY3AtPmF1dGgubXNnLmhkY3AxLmtzdmxpc3QsCisJICAgICAgIGhkY3AtPmF1dGgu
bXNnLmhkY3AxLmtzdmxpc3Rfc2l6ZSk7CisKKwltZW1jcHkoaGRjcF9jbWQtPmluX21zZy5oZGNw
MV9zZWNvbmRfcGFydF9hdXRoZW50aWNhdGlvbi52X3ByaW1lLCBoZGNwLT5hdXRoLm1zZy5oZGNw
MS52cCwKKwkgICAgICAgc2l6ZW9mKGhkY3AtPmF1dGgubXNnLmhkY3AxLnZwKSk7CisKKwloZGNw
X2NtZC0+aW5fbXNnLmhkY3AxX3NlY29uZF9wYXJ0X2F1dGhlbnRpY2F0aW9uLmJzdGF0dXNfYmlu
Zm8gPQorCQlpc19kcF9oZGNwKGhkY3ApID8gaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmluZm9fZHAg
OiBoZGNwLT5hdXRoLm1zZy5oZGNwMS5ic3RhdHVzOworCWhkY3BfY21kLT5jbWRfaWQgPSBUQV9I
RENQX0NPTU1BTkRfX0hEQ1AxX1NFQ09ORF9QQVJUX0FVVEhFTlRJQ0FUSU9OOworCisJcHNwX2hk
Y3BfaW52b2tlKHBzcCwgaGRjcF9jbWQtPmNtZF9pZCk7CisKKwlpZiAoaGRjcF9jbWQtPmhkY3Bf
c3RhdHVzICE9IFRBX0hEQ1BfU1RBVFVTX19TVUNDRVNTKQorCQlyZXR1cm4gTU9EX0hEQ1BfU1RB
VFVTX0hEQ1AxX1ZBTElEQVRFX0tTVl9MSVNUX0ZBSUxVUkU7CisKKwlyZXR1cm4gTU9EX0hEQ1Bf
U1RBVFVTX1NVQ0NFU1M7Cit9CisKK2VudW0gbW9kX2hkY3Bfc3RhdHVzIG1vZF9oZGNwX2hkY3Ax
X2VuYWJsZV9kcF9zdHJlYW1fZW5jcnlwdGlvbihzdHJ1Y3QgbW9kX2hkY3AgKmhkY3ApCit7CisK
KwlzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCA9IGhkY3AtPmNvbmZpZy5wc3AuaGFuZGxlOworCXN0
cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkgKmhkY3BfY21kOworCWludCBpID0gMDsKKworCWhk
Y3BfY21kID0gKHN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkgKilwc3AtPmhkY3BfY29udGV4
dC5oZGNwX3NoYXJlZF9idWY7CisKKwlmb3IgKGkgPSAwOyBpIDwgTUFYX05VTV9PRl9ESVNQTEFZ
UzsgaSsrKSB7CisKKwkJaWYgKGhkY3AtPmNvbm5lY3Rpb24uZGlzcGxheXNbaV0uc3RhdGUgIT0g
TU9EX0hEQ1BfRElTUExBWV9BQ1RJVkVfQU5EX0FEREVEIHx8CisJCSAgICBoZGNwLT5jb25uZWN0
aW9uLmRpc3BsYXlzW2ldLmFkanVzdC5kaXNhYmxlKQorCQkJY29udGludWU7CisKKwkJbWVtc2V0
KGhkY3BfY21kLCAwLCBzaXplb2Yoc3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSkpOworCisJ
CWhkY3BfY21kLT5pbl9tc2cuaGRjcDFfZW5hYmxlX2RwX3N0cmVhbV9lbmNyeXB0aW9uLnNlc3Np
b25faGFuZGxlID0gaGRjcC0+YXV0aC5pZDsKKwkJaGRjcF9jbWQtPmluX21zZy5oZGNwMV9lbmFi
bGVfZHBfc3RyZWFtX2VuY3J5cHRpb24uZGlzcGxheV9oYW5kbGUgPSBoZGNwLT5jb25uZWN0aW9u
LmRpc3BsYXlzW2ldLmluZGV4OworCQloZGNwX2NtZC0+Y21kX2lkID0gVEFfSERDUF9DT01NQU5E
X19IRENQMV9FTkFCTEVfRFBfU1RSRUFNX0VOQ1JZUFRJT047CisKKwkJcHNwX2hkY3BfaW52b2tl
KHBzcCwgaGRjcF9jbWQtPmNtZF9pZCk7CisKKwkJaWYgKGhkY3BfY21kLT5oZGNwX3N0YXR1cyAh
PSBUQV9IRENQX1NUQVRVU19fU1VDQ0VTUykKKwkJCXJldHVybiBNT0RfSERDUF9TVEFUVVNfSERD
UDFfRU5BQkxFX1NUUkVBTV9FTkNSWVBUSU9OX0ZBSUxVUkU7CisKKwkJaGRjcC0+Y29ubmVjdGlv
bi5kaXNwbGF5c1tpXS5zdGF0ZSA9IE1PRF9IRENQX0RJU1BMQVlfRU5DUllQVElPTl9FTkFCTEVE
OworCQlIRENQX0hEQ1AxX0VOQUJMRURfVFJBQ0UoaGRjcCwgaGRjcC0+Y29ubmVjdGlvbi5kaXNw
bGF5c1tpXS5pbmRleCk7CisJfQorCisJcmV0dXJuIE1PRF9IRENQX1NUQVRVU19TVUNDRVNTOwor
fQorCitlbnVtIG1vZF9oZGNwX3N0YXR1cyBtb2RfaGRjcF9oZGNwMV9saW5rX21haW50ZW5hbmNl
KHN0cnVjdCBtb2RfaGRjcCAqaGRjcCkKK3sKKwlzdHJ1Y3QgcHNwX2NvbnRleHQgKnBzcCA9IGhk
Y3AtPmNvbmZpZy5wc3AuaGFuZGxlOworCXN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkgKmhk
Y3BfY21kOworCisJaGRjcF9jbWQgPSAoc3RydWN0IHRhX2hkY3Bfc2hhcmVkX21lbW9yeSAqKXBz
cC0+aGRjcF9jb250ZXh0LmhkY3Bfc2hhcmVkX2J1ZjsKKworCW1lbXNldChoZGNwX2NtZCwgMCwg
c2l6ZW9mKHN0cnVjdCB0YV9oZGNwX3NoYXJlZF9tZW1vcnkpKTsKKworCWhkY3BfY21kLT5pbl9t
c2cuaGRjcDFfZ2V0X2VuY3J5cHRpb25fc3RhdHVzLnNlc3Npb25faGFuZGxlID0gaGRjcC0+YXV0
aC5pZDsKKworCWhkY3BfY21kLT5vdXRfbXNnLmhkY3AxX2dldF9lbmNyeXB0aW9uX3N0YXR1cy5w
cm90ZWN0aW9uX2xldmVsID0gMDsKKwloZGNwX2NtZC0+Y21kX2lkID0gVEFfSERDUF9DT01NQU5E
X19IRENQMV9HRVRfRU5DUllQVElPTl9TVEFUVVM7CisKKwlwc3BfaGRjcF9pbnZva2UocHNwLCBo
ZGNwX2NtZC0+Y21kX2lkKTsKKworCWlmIChoZGNwX2NtZC0+aGRjcF9zdGF0dXMgIT0gVEFfSERD
UF9TVEFUVVNfX1NVQ0NFU1MpCisJCXJldHVybiBNT0RfSERDUF9TVEFUVVNfSERDUDFfTElOS19N
QUlOVEVOQU5DRV9GQUlMVVJFOworCisJcmV0dXJuIChoZGNwX2NtZC0+b3V0X21zZy5oZGNwMV9n
ZXRfZW5jcnlwdGlvbl9zdGF0dXMucHJvdGVjdGlvbl9sZXZlbCA9PSAxKQorCQkgICAgICAgPyBN
T0RfSERDUF9TVEFUVVNfU1VDQ0VTUworCQkgICAgICAgOiBNT0RfSERDUF9TVEFUVVNfSERDUDFf
TElOS19NQUlOVEVOQU5DRV9GQUlMVVJFOworfQorCitlbnVtIG1vZF9oZGNwX3N0YXR1cyBtb2Rf
aGRjcF9oZGNwMV9nZXRfbGlua19lbmNyeXB0aW9uX3N0YXR1cyhzdHJ1Y3QgbW9kX2hkY3AgKmhk
Y3AsCisJCQkJCQkJICAgICAgIGVudW0gbW9kX2hkY3BfZW5jcnlwdGlvbl9zdGF0dXMgKmVuY3J5
cHRpb25fc3RhdHVzKQoreworCSplbmNyeXB0aW9uX3N0YXR1cyA9IE1PRF9IRENQX0VOQ1JZUFRJ
T05fU1RBVFVTX0hEQ1BfT0ZGOworCisJaWYgKG1vZF9oZGNwX2hkY3AxX2xpbmtfbWFpbnRlbmFu
Y2UoaGRjcCkgIT0gTU9EX0hEQ1BfU1RBVFVTX1NVQ0NFU1MpCisJCXJldHVybiBNT0RfSERDUF9T
VEFUVVNfRkFJTFVSRTsKKworCSplbmNyeXB0aW9uX3N0YXR1cyA9IE1PRF9IRENQX0VOQ1JZUFRJ
T05fU1RBVFVTX0hEQ1AxX09OOworCisJcmV0dXJuIE1PRF9IRENQX1NUQVRVU19TVUNDRVNTOwor
fQorCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNw
L2hkY3BfcHNwLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hk
Y3BfcHNwLmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi45ODZmYzA3
ZWE5ZWEKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9k
dWxlcy9oZGNwL2hkY3BfcHNwLmgKQEAgLTAsMCArMSwyNzIgQEAKKy8qCisgKiBDb3B5cmlnaHQg
MjAxOSBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCisgKgorICogUGVybWlzc2lvbiBpcyBo
ZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEK
KyAqIGNvcHkgb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZp
bGVzICh0aGUgIlNvZnR3YXJlIiksCisgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0
IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uCisgKiB0aGUgcmlnaHRz
IHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwgc3VibGlj
ZW5zZSwKKyAqIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFuZCB0byBwZXJt
aXQgcGVyc29ucyB0byB3aG9tIHRoZQorICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNv
LCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyAqCisgKiBUaGUgYWJvdmUg
Y29weXJpZ2h0IG5vdGljZSBhbmQgdGhpcyBwZXJtaXNzaW9uIG5vdGljZSBzaGFsbCBiZSBpbmNs
dWRlZCBpbgorICogYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9ucyBvZiB0aGUgU29m
dHdhcmUuCisgKgorICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJUyIsIFdJVEhPVVQg
V0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVYUFJFU1MgT1IKKyAqIElNUExJRUQsIElOQ0xVRElORyBC
VVQgTk9UIExJTUlURUQgVE8gVEhFIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorICog
RklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklORlJJTkdFTUVOVC4gIElO
IE5PIEVWRU5UIFNIQUxMCisgKiBUSEUgQ09QWVJJR0hUIEhPTERFUihTKSBPUiBBVVRIT1IoUykg
QkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IKKyAqIE9USEVSIExJQUJJTElUWSwg
V0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLAorICog
QVJJU0lORyBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBP
UiBUSEUgVVNFIE9SCisgKiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCisgKgorICog
QXV0aG9yczogQU1ECisgKgorICovCisKKyNpZm5kZWYgTU9EVUxFU19IRENQX0hEQ1BfUFNQX0hf
CisjZGVmaW5lIE1PRFVMRVNfSERDUF9IRENQX1BTUF9IXworCisvKgorICogTk9URTogVGhlc2Ug
cGFyYW1ldGVycyBhcmUgYSBvbmUtdG8tb25lIGNvcHkgb2YgdGhlCisgKiBwYXJhbWV0ZXJzIHJl
cXVpcmVkIGJ5IFBTUAorICovCitlbnVtIGJnZF9zZWN1cml0eV9oZGNwX2VuY3J5cHRpb25fbGV2
ZWwgeworCUhEQ1BfRU5DUllQVElPTl9MRVZFTF9fSU5WQUxJRCA9IDAsCisJSERDUF9FTkNSWVBU
SU9OX0xFVkVMX19PRkYsCisJSERDUF9FTkNSWVBUSU9OX0xFVkVMX19PTgorfTsKKworZW51bSB0
YV9kdG1fY29tbWFuZCB7CisJVEFfRFRNX0NPTU1BTkRfX1VOVVNFRF8xID0gMSwKKwlUQV9EVE1f
Q09NTUFORF9fVE9QT0xPR1lfVVBEQVRFX1YyLAorCVRBX0RUTV9DT01NQU5EX19UT1BPTE9HWV9B
U1NSX0VOQUJMRQorfTsKKworLyogRFRNIHJlbGF0ZWQgZW51bWVyYXRpb25zICovCisvKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KKwor
ZW51bSB0YV9kdG1fc3RhdHVzIHsKKwlUQV9EVE1fU1RBVFVTX19TVUNDRVNTID0gMHgwMCwKKwlU
QV9EVE1fU1RBVFVTX19HRU5FUklDX0ZBSUxVUkUgPSAweDAxLAorCVRBX0RUTV9TVEFUVVNfX0lO
VkFMSURfUEFSQU1FVEVSID0gMHgwMiwKKwlUQV9EVE1fU1RBVFVTX19OVUxMX1BPSU5URVIgPSAw
eDMKK307CisKKy8qIGlucHV0L291dHB1dCBzdHJ1Y3R1cmVzIGZvciBEVE0gY29tbWFuZHMgKi8K
Ky8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqLworLyoqCisgKiBJbnB1dCBzdHJ1Y3R1cmVzCisgKi8KK2VudW0gdGFfZHRtX2hkY3BfdmVy
c2lvbl9tYXhfc3VwcG9ydGVkIHsKKwlUQV9EVE1fSERDUF9WRVJTSU9OX01BWF9TVVBQT1JURURf
X05PTkUgPSAwLAorCVRBX0RUTV9IRENQX1ZFUlNJT05fTUFYX1NVUFBPUlRFRF9fMV94ID0gMTAs
CisJVEFfRFRNX0hEQ1BfVkVSU0lPTl9NQVhfU1VQUE9SVEVEX18yXzAgPSAyMCwKKwlUQV9EVE1f
SERDUF9WRVJTSU9OX01BWF9TVVBQT1JURURfXzJfMSA9IDIxLAorCVRBX0RUTV9IRENQX1ZFUlNJ
T05fTUFYX1NVUFBPUlRFRF9fMl8yID0gMjIsCisJVEFfRFRNX0hEQ1BfVkVSU0lPTl9NQVhfU1VQ
UE9SVEVEX18yXzMgPSAyMworfTsKKworc3RydWN0IHRhX2R0bV90b3BvbG9neV91cGRhdGVfaW5w
dXRfdjIgeworCS8qIGRpc3BsYXkgaGFuZGxlIGlzIHVuaXF1ZSBhY3Jvc3MgdGhlIGRyaXZlciBh
bmQgaXMgdXNlZCB0byBpZGVudGlmeSBhIGRpc3BsYXkgKi8KKwkvKiBmb3IgYWxsIHNlY3VyaXR5
IGludGVyZmFjZXMgd2hpY2ggcmVmZXJlbmNlIGRpc3BsYXlzIHN1Y2ggYXMgSERDUCAqLworCXVp
bnQzMl90IGRpc3BsYXlfaGFuZGxlOworCXVpbnQzMl90IGlzX2FjdGl2ZTsKKwl1aW50MzJfdCBp
c19taXJhY2FzdDsKKwl1aW50MzJfdCBjb250cm9sbGVyOworCXVpbnQzMl90IGRkY19saW5lOwor
CXVpbnQzMl90IGRpZ19iZTsKKwl1aW50MzJfdCBkaWdfZmU7CisJdWludDMyX3QgZHBfbXN0X3Zj
aWQ7CisJdWludDMyX3QgaXNfYXNzcjsKKwl1aW50MzJfdCBtYXhfaGRjcF9zdXBwb3J0ZWRfdmVy
c2lvbjsKK307CisKK3N0cnVjdCB0YV9kdG1fdG9wb2xvZ3lfYXNzcl9lbmFibGUgeworCXVpbnQz
Ml90IGRpc3BsYXlfdG9wb2xvZ3lfZGlnX2JlX2luZGV4OworfTsKKworLyoqCisgKiBPdXRwdXQg
c3RydWN0dXJlcworICovCisKKy8qIE5vIG91dHB1dCBzdHJ1Y3R1cmVzIHlldCAqLworCit1bmlv
biB0YV9kdG1fY21kX2lucHV0IHsKKwlzdHJ1Y3QgdGFfZHRtX3RvcG9sb2d5X3VwZGF0ZV9pbnB1
dF92MiB0b3BvbG9neV91cGRhdGVfdjI7CisJc3RydWN0IHRhX2R0bV90b3BvbG9neV9hc3NyX2Vu
YWJsZSB0b3BvbG9neV9hc3NyX2VuYWJsZTsKK307CisKK3VuaW9uIHRhX2R0bV9jbWRfb3V0cHV0
IHsKKwl1aW50MzJfdCByZXNlcnZlZDsKK307CisKK3N0cnVjdCB0YV9kdG1fc2hhcmVkX21lbW9y
eSB7CisJdWludDMyX3QgY21kX2lkOworCXVpbnQzMl90IHJlc3BfaWQ7CisJZW51bSB0YV9kdG1f
c3RhdHVzIGR0bV9zdGF0dXM7CisJdWludDMyX3QgcmVzZXJ2ZWQ7CisJdW5pb24gdGFfZHRtX2Nt
ZF9pbnB1dCBkdG1faW5fbWVzc2FnZTsKKwl1bmlvbiB0YV9kdG1fY21kX291dHB1dCBkdG1fb3V0
X21lc3NhZ2U7Cit9OworCitpbnQgcHNwX2NtZF9zdWJtaXRfYnVmKHN0cnVjdCBwc3BfY29udGV4
dCAqcHNwLCBzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2luZm8gKnVjb2RlLCBzdHJ1Y3QgcHNwX2dm
eF9jbWRfcmVzcCAqY21kLAorCQl1aW50NjRfdCBmZW5jZV9tY19hZGRyKTsKKworZW51bSB0YV9o
ZGNwX2NvbW1hbmQgeworCVRBX0hEQ1BfQ09NTUFORF9fSU5JVElBTElaRSwKKwlUQV9IRENQX0NP
TU1BTkRfX0hEQ1AxX0NSRUFURV9TRVNTSU9OLAorCVRBX0hEQ1BfQ09NTUFORF9fSERDUDFfREVT
VFJPWV9TRVNTSU9OLAorCVRBX0hEQ1BfQ09NTUFORF9fSERDUDFfRklSU1RfUEFSVF9BVVRIRU5U
SUNBVElPTiwKKwlUQV9IRENQX0NPTU1BTkRfX0hEQ1AxX1NFQ09ORF9QQVJUX0FVVEhFTlRJQ0FU
SU9OLAorCVRBX0hEQ1BfQ09NTUFORF9fSERDUDFfRU5BQkxFX0VOQ1JZUFRJT04sCisJVEFfSERD
UF9DT01NQU5EX19IRENQMV9FTkFCTEVfRFBfU1RSRUFNX0VOQ1JZUFRJT04sCisJVEFfSERDUF9D
T01NQU5EX19IRENQMV9HRVRfRU5DUllQVElPTl9TVEFUVVMsCit9OworCisKKy8qIEhEQ1AgcmVs
YXRlZCBlbnVtZXJhdGlvbnMgKi8KKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqLworI2RlZmluZSBUQV9IRENQX19JTlZBTElEX1NFU1NJ
T04gMHhGRkZGCisjZGVmaW5lIFRBX0hEQ1BfX0hEQ1AxX0FOX1NJWkUgOAorI2RlZmluZSBUQV9I
RENQX19IRENQMV9LU1ZfU0laRSA1CisjZGVmaW5lIFRBX0hEQ1BfX0hEQ1AxX0tTVl9MSVNUX01B
WF9FTlRSSUVTIDEyNworI2RlZmluZSBUQV9IRENQX19IRENQMV9WX1BSSU1FX1NJWkUgMjAKKwor
ZW51bSB0YV9oZGNwX3N0YXR1cyB7CisJVEFfSERDUF9TVEFUVVNfX1NVQ0NFU1MgPSAweDAwLAor
CVRBX0hEQ1BfU1RBVFVTX19HRU5FUklDX0ZBSUxVUkUgPSAweDAxLAorCVRBX0hEQ1BfU1RBVFVT
X19OVUxMX1BPSU5URVIgPSAweDAyLAorCVRBX0hEQ1BfU1RBVFVTX19GQUlMRURfQUxMT0NBVElO
R19TRVNTSU9OID0gMHgwMywKKwlUQV9IRENQX1NUQVRVU19fRkFJTEVEX1NFVFVQX1RYID0gMHgw
NCwKKwlUQV9IRENQX1NUQVRVU19fSU5WQUxJRF9QQVJBTUVURVIgPSAweDA1LAorCVRBX0hEQ1Bf
U1RBVFVTX19WSFhfRVJST1IgPSAweDA2LAorCVRBX0hEQ1BfU1RBVFVTX19TRVNTSU9OX05PVF9D
TE9TRURfUFJPUEVSTFkgPSAweDA3LAorCVRBX0hEQ1BfU1RBVFVTX19TUk1fRkFJTFVSRSA9IDB4
MDgsCisJVEFfSERDUF9TVEFUVVNfX01TVF9BVVRIRU5USUNBVEVEX0FMUkVBRFlfU1RBUlRFRCA9
IDB4MDksCisJVEFfSERDUF9TVEFUVVNfX0FLRV9TRU5EX0NFUlRfRkFJTFVSRSA9IDB4MEEsCisJ
VEFfSERDUF9TVEFUVVNfX0FLRV9OT19TVE9SRURfS01fRkFJTFVSRSA9IDB4MEIsCisJVEFfSERD
UF9TVEFUVVNfX0FLRV9TRU5EX0hQUklNRV9GQUlMVVJFID0gMHgwQywKKwlUQV9IRENQX1NUQVRV
U19fTENfU0VORF9MUFJJTUVfRkFJTFVSRSA9IDB4MEQsCisJVEFfSERDUF9TVEFUVVNfX1NLRV9T
RU5EX0VLU19GQUlMVVJFID0gMHgwRSwKKwlUQV9IRENQX1NUQVRVU19fUkVQQVVUSF9TRU5EX1JY
SURMSVNUX0ZBSUxVUkUgPSAweDBGLAorCVRBX0hEQ1BfU1RBVFVTX19SRVBBVVRIX1NUUkVBTV9S
RUFEWV9GQUlMVVJFID0gMHgxMCwKKwlUQV9IRENQX1NUQVRVU19fQVNEX0dFTkVSSUNfRkFJTFVS
RSA9IDB4MTEsCisJVEFfSERDUF9TVEFUVVNfX1VOV1JBUF9TRUNSRVRfRkFJTFVSRSA9IDB4MTIs
CisJVEFfSERDUF9TVEFUVVNfX0VOQUJMRV9FTkNSX0ZBSUxVUkUgPSAweDEzLAorCVRBX0hEQ1Bf
U1RBVFVTX19ESVNBQkxFX0VOQ1JfRkFJTFVSRSA9IDB4MTQsCisJVEFfSERDUF9TVEFUVVNfX05P
VF9FTk9VR0hfTUVNT1JZX0ZBSUxVUkUgPSAweDE1LAorCVRBX0hEQ1BfU1RBVFVTX19VTktOT1dO
X01FU1NBR0UgPSAweDE2LAorCVRBX0hEQ1BfU1RBVFVTX19UT09fTUFOWV9TVFJFQU0gPSAweDE3
Cit9OworCitlbnVtIHRhX2hkY3BfYXV0aGVudGljYXRpb25fc3RhdHVzIHsKKwlUQV9IRENQX0FV
VEhFTlRJQ0FUSU9OX1NUQVRVU19fTk9UX1NUQVJURUQgPSAweDAwLAorCVRBX0hEQ1BfQVVUSEVO
VElDQVRJT05fU1RBVFVTX19IRENQMV9GSVJTVF9QQVJUX0ZBSUxFRCA9IDB4MDEsCisJVEFfSERD
UF9BVVRIRU5USUNBVElPTl9TVEFUVVNfX0hEQ1AxX0ZJUlNUX1BBUlRfQ09NUExFVEUgPSAweDAy
LAorCVRBX0hEQ1BfQVVUSEVOVElDQVRJT05fU1RBVFVTX19IRENQMV9TRUNPTkRfUEFSVF9GQUlM
RUQgPSAweDAzLAorCVRBX0hEQ1BfQVVUSEVOVElDQVRJT05fU1RBVFVTX19IRENQMV9BVVRIRU5U
SUNBVEVEID0gMHgwNCwKKwlUQV9IRENQX0FVVEhFTlRJQ0FUSU9OX1NUQVRVU19fSERDUDFfS1NW
X1ZBTElEQVRJT05fRkFJTEVEID0gMHgwOQorfTsKKworCisvKiBpbnB1dC9vdXRwdXQgc3RydWN0
dXJlcyBmb3IgSERDUCBjb21tYW5kcyAqLworLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKiovCitzdHJ1Y3QgdGFfaGRjcF9jbWRfaGRjcDFf
Y3JlYXRlX3Nlc3Npb25faW5wdXQgeworCXVpbnQ4X3QgZGlzcGxheV9oYW5kbGU7Cit9OworCitz
dHJ1Y3QgdGFfaGRjcF9jbWRfaGRjcDFfY3JlYXRlX3Nlc3Npb25fb3V0cHV0IHsKKwl1aW50MzJf
dCBzZXNzaW9uX2hhbmRsZTsKKwl1aW50OF90IGFuX3ByaW1hcnlbVEFfSERDUF9fSERDUDFfQU5f
U0laRV07CisJdWludDhfdCBha3N2X3ByaW1hcnlbVEFfSERDUF9fSERDUDFfS1NWX1NJWkVdOwor
CXVpbnQ4X3QgYWluZm9fcHJpbWFyeTsKKwl1aW50OF90IGFuX3NlY29uZGFyeVtUQV9IRENQX19I
RENQMV9BTl9TSVpFXTsKKwl1aW50OF90IGFrc3Zfc2Vjb25kYXJ5W1RBX0hEQ1BfX0hEQ1AxX0tT
Vl9TSVpFXTsKKwl1aW50OF90IGFpbmZvX3NlY29uZGFyeTsKK307CisKK3N0cnVjdCB0YV9oZGNw
X2NtZF9oZGNwMV9kZXN0cm95X3Nlc3Npb25faW5wdXQgeworCXVpbnQzMl90IHNlc3Npb25faGFu
ZGxlOworfTsKKworc3RydWN0IHRhX2hkY3BfY21kX2hkY3AxX2ZpcnN0X3BhcnRfYXV0aGVudGlj
YXRpb25faW5wdXQgeworCXVpbnQzMl90IHNlc3Npb25faGFuZGxlOworCXVpbnQ4X3QgYmtzdl9w
cmltYXJ5W1RBX0hEQ1BfX0hEQ1AxX0tTVl9TSVpFXTsKKwl1aW50OF90IGJrc3Zfc2Vjb25kYXJ5
W1RBX0hEQ1BfX0hEQ1AxX0tTVl9TSVpFXTsKKwl1aW50OF90IGJjYXBzOworCXVpbnQxNl90IHIw
X3ByaW1lX3ByaW1hcnk7CisJdWludDE2X3QgcjBfcHJpbWVfc2Vjb25kYXJ5OworfTsKKworc3Ry
dWN0IHRhX2hkY3BfY21kX2hkY3AxX2ZpcnN0X3BhcnRfYXV0aGVudGljYXRpb25fb3V0cHV0IHsK
KwllbnVtIHRhX2hkY3BfYXV0aGVudGljYXRpb25fc3RhdHVzIGF1dGhlbnRpY2F0aW9uX3N0YXR1
czsKK307CisKK3N0cnVjdCB0YV9oZGNwX2NtZF9oZGNwMV9zZWNvbmRfcGFydF9hdXRoZW50aWNh
dGlvbl9pbnB1dCB7CisJdWludDMyX3Qgc2Vzc2lvbl9oYW5kbGU7CisJdWludDE2X3QgYnN0YXR1
c19iaW5mbzsKKwl1aW50OF90IGtzdl9saXN0W1RBX0hEQ1BfX0hEQ1AxX0tTVl9MSVNUX01BWF9F
TlRSSUVTXVtUQV9IRENQX19IRENQMV9LU1ZfU0laRV07CisJdWludDMyX3Qga3N2X2xpc3Rfc2l6
ZTsKKwl1aW50OF90IHBqX3ByaW1lOworCXVpbnQ4X3Qgdl9wcmltZVtUQV9IRENQX19IRENQMV9W
X1BSSU1FX1NJWkVdOworfTsKKworc3RydWN0IHRhX2hkY3BfY21kX2hkY3AxX3NlY29uZF9wYXJ0
X2F1dGhlbnRpY2F0aW9uX291dHB1dCB7CisJZW51bSB0YV9oZGNwX2F1dGhlbnRpY2F0aW9uX3N0
YXR1cyBhdXRoZW50aWNhdGlvbl9zdGF0dXM7Cit9OworCitzdHJ1Y3QgdGFfaGRjcF9jbWRfaGRj
cDFfZW5hYmxlX2VuY3J5cHRpb25faW5wdXQgeworCXVpbnQzMl90IHNlc3Npb25faGFuZGxlOwor
fTsKKworc3RydWN0IHRhX2hkY3BfY21kX2hkY3AxX2VuYWJsZV9kcF9zdHJlYW1fZW5jcnlwdGlv
bl9pbnB1dCB7CisJdWludDMyX3Qgc2Vzc2lvbl9oYW5kbGU7CisJdWludDMyX3QgZGlzcGxheV9o
YW5kbGU7Cit9OworCitzdHJ1Y3QgdGFfaGRjcF9jbWRfaGRjcDFfZ2V0X2VuY3J5cHRpb25fc3Rh
dHVzX2lucHV0IHsKKwl1aW50MzJfdCBzZXNzaW9uX2hhbmRsZTsKK307CisKK3N0cnVjdCB0YV9o
ZGNwX2NtZF9oZGNwMV9nZXRfZW5jcnlwdGlvbl9zdGF0dXNfb3V0cHV0IHsKKwl1aW50MzJfdCBw
cm90ZWN0aW9uX2xldmVsOworfTsKKworLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKiovCisvKiBDb21tb24gaW5wdXQgc3RydWN0dXJlIGZv
ciBIRENQIGNhbGxiYWNrcyAqLwordW5pb24gdGFfaGRjcF9jbWRfaW5wdXQgeworCXN0cnVjdCB0
YV9oZGNwX2NtZF9oZGNwMV9jcmVhdGVfc2Vzc2lvbl9pbnB1dCBoZGNwMV9jcmVhdGVfc2Vzc2lv
bjsKKwlzdHJ1Y3QgdGFfaGRjcF9jbWRfaGRjcDFfZGVzdHJveV9zZXNzaW9uX2lucHV0IGhkY3Ax
X2Rlc3Ryb3lfc2Vzc2lvbjsKKwlzdHJ1Y3QgdGFfaGRjcF9jbWRfaGRjcDFfZmlyc3RfcGFydF9h
dXRoZW50aWNhdGlvbl9pbnB1dCBoZGNwMV9maXJzdF9wYXJ0X2F1dGhlbnRpY2F0aW9uOworCXN0
cnVjdCB0YV9oZGNwX2NtZF9oZGNwMV9zZWNvbmRfcGFydF9hdXRoZW50aWNhdGlvbl9pbnB1dCBo
ZGNwMV9zZWNvbmRfcGFydF9hdXRoZW50aWNhdGlvbjsKKwlzdHJ1Y3QgdGFfaGRjcF9jbWRfaGRj
cDFfZW5hYmxlX2VuY3J5cHRpb25faW5wdXQgaGRjcDFfZW5hYmxlX2VuY3J5cHRpb247CisJc3Ry
dWN0IHRhX2hkY3BfY21kX2hkY3AxX2VuYWJsZV9kcF9zdHJlYW1fZW5jcnlwdGlvbl9pbnB1dCBo
ZGNwMV9lbmFibGVfZHBfc3RyZWFtX2VuY3J5cHRpb247CisJc3RydWN0IHRhX2hkY3BfY21kX2hk
Y3AxX2dldF9lbmNyeXB0aW9uX3N0YXR1c19pbnB1dCBoZGNwMV9nZXRfZW5jcnlwdGlvbl9zdGF0
dXM7Cit9OworCisvKiBDb21tb24gb3V0cHV0IHN0cnVjdHVyZSBmb3IgSERDUCBjYWxsYmFja3Mg
Ki8KK3VuaW9uIHRhX2hkY3BfY21kX291dHB1dCB7CisJc3RydWN0IHRhX2hkY3BfY21kX2hkY3Ax
X2NyZWF0ZV9zZXNzaW9uX291dHB1dCBoZGNwMV9jcmVhdGVfc2Vzc2lvbjsKKwlzdHJ1Y3QgdGFf
aGRjcF9jbWRfaGRjcDFfZmlyc3RfcGFydF9hdXRoZW50aWNhdGlvbl9vdXRwdXQgaGRjcDFfZmly
c3RfcGFydF9hdXRoZW50aWNhdGlvbjsKKwlzdHJ1Y3QgdGFfaGRjcF9jbWRfaGRjcDFfc2Vjb25k
X3BhcnRfYXV0aGVudGljYXRpb25fb3V0cHV0IGhkY3AxX3NlY29uZF9wYXJ0X2F1dGhlbnRpY2F0
aW9uOworCXN0cnVjdCB0YV9oZGNwX2NtZF9oZGNwMV9nZXRfZW5jcnlwdGlvbl9zdGF0dXNfb3V0
cHV0IGhkY3AxX2dldF9lbmNyeXB0aW9uX3N0YXR1czsKK307CisvKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KKworc3RydWN0IHRhX2hk
Y3Bfc2hhcmVkX21lbW9yeSB7CisJdWludDMyX3QgY21kX2lkOworCWVudW0gdGFfaGRjcF9zdGF0
dXMgaGRjcF9zdGF0dXM7CisJdWludDMyX3QgcmVzZXJ2ZWQ7CisJdW5pb24gdGFfaGRjcF9jbWRf
aW5wdXQgaW5fbXNnOworCXVuaW9uIHRhX2hkY3BfY21kX291dHB1dCBvdXRfbXNnOworfTsKKwor
ZW51bSBwc3Bfc3RhdHVzIHsKKwlQU1BfU1RBVFVTX19TVUNDRVNTID0gMCwKKwlQU1BfU1RBVFVT
X19FUlJPUl9JTlZBTElEX1BBUkFNUywKKwlQU1BfU1RBVFVTX19FUlJPUl9HRU5FUklDLAorCVBT
UF9TVEFUVVNfX0VSUk9SX09VVF9PRl9NRU1PUlksCisJUFNQX1NUQVRVU19fRVJST1JfVU5TVVBQ
T1JURURfRkVBVFVSRQorfTsKKworI2VuZGlmIC8qIE1PRFVMRVNfSERDUF9IRENQX1BTUF9IXyAq
LwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
