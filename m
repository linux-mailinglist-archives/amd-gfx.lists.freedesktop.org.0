Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA05837F19
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D12892D4;
	Thu,  6 Jun 2019 20:55:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790071.outbound.protection.outlook.com [40.107.79.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E57C892D4
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:48 +0000 (UTC)
Received: from DM3PR12CA0051.namprd12.prod.outlook.com (10.161.151.19) by
 BN7PR12MB2657.namprd12.prod.outlook.com (20.176.176.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 20:55:46 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0051.outlook.office365.com
 (2603:10b6:0:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:06 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:04 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 03/24] drm/amd/display: Copy stream updates onto streams
Date: Thu, 6 Jun 2019 16:54:40 -0400
Message-ID: <20190606205501.16505-4-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(68736007)(2616005)(26005)(446003)(11346002)(426003)(86362001)(1076003)(76176011)(305945005)(8676002)(486006)(77096007)(336012)(51416003)(126002)(476003)(6916009)(47776003)(186003)(7696005)(70206006)(70586007)(5660300002)(4326008)(36756003)(81166006)(81156014)(53416004)(2906002)(8936002)(478600001)(50466002)(356004)(53936002)(48376002)(16586007)(6666004)(50226002)(316002)(2351001)(14444005)(15650500001)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2657; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a9b2232-2e66-4836-2dcc-08d6eac14150
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2657; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2657:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2657919469B0E309B68AEFC5F9170@BN7PR12MB2657.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RBiaiB5ZKPFLiys4TY2/yXI8WD30UsyVMNjbj+BdUICAu6JIoYKLvXW2/M9FrA7Y171+jdULSbhPWt9/U8MQLWt82RBw4L57ngkYHbw6koc5UTsBzny4OE+6uYkOjRN0rF5f+72iEf0MxfTr90/HeUvmKHVo8xrAt7x/zVOXZPvRKcCHDUYp0MPDfNyT3r9cp2ofKKVYcJRNpHH2uhWh3DiBUDuyIZKiK3mYfjM3QyM0HRD342MI3o6GVNn+dG1KhC+sPE07lYn+pehUI0YMPiHszwbdvA0dM55CjZD37zDA/H19Jqw11JYOEUGey26ss6OzsyPaqQpKFPk7qmsCwFgG8POWDr+IbSW2ixKYYxYsxm55wZ1sWiHu5shnoYa29Xq17dPiE3WCoAx53lRtQyiCG/SMN91K3CryFbKue8I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:06.3643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9b2232-2e66-4836-2dcc-08d6eac14150
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2657
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hO3Ji4Jf323JmDUkbg//FEqDfDnkbSRW07Tn2s+lKjk=;
 b=Fzsd+6my1qQG/AOMJiUS64MiQ///H9A9bKIbMejT6ZqDUuCkE1O5v7af0l3sS5utzNBrfLMBE6jxozy5ZXQ2Qhy/R5bSYdFZVnLw5/cmVqBHHhoEj5AAuE7+rKmKsJch8gt7aBH2YGaBclItzeXTkZQfB0rBRG0VH2F9iqgSV+4=
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
W1doeV0KQWxtb3N0IGV2ZXJ5IGZ1bmN0aW9uIGluIERDIHRoYXQgd29ya3Mgd2l0aCBzdHJlYW0g
c3RhdGUgZXhwZWN0cyB0aGF0CnRoZSBjdXJyZW50IHN0YXRlIG9uIHRoZSBzdHJlYW0gaXMgdGhl
IG9uZSB0aGF0IGl0IHNob3VsZCBiZSB3cml0aW5nCm91dC4gVGhlc2UgZnVuY3Rpb25zIGFyZSB0
eXBpY2FsbHkgdHJpZ2dlcmVkIGJ5IHNwZWNpZnlpbmcgYSBwYXJ0aWN1bGFyCnN0cmVhbSB1cGRh
dGUgLSBidXQgdGhlIGFjdHVhbCBjb250ZW50cyBvZiB0aGUgc3RyZWFtIHVwZGF0ZSBpdHNlbGYK
YXJlIGlnbm9yZWQsIGxlYXZpbmcgaXQgdG8gdGhlIERNIHRvIGFjdHVhbGx5IHVwZGF0ZSB0aGUg
c3RyZWFtIHN0YXRlCml0c2VsZi4KClRoZSBwcm9ibGVtIHdpdGggZG9pbmcgdGhpcyBpbiBETSBp
cyBhIG1hdHRlciBvZiB0aW1pbmcuIE9uIExpbnV4Cm1vc3Qgb2YgdGhpcyBpcyBpbmNvcnJlY3Rs
eSBkb25lIGluIGF0b21pYyBjaGVjaywgd2hlbiB3ZSBhY3R1YWxseSB3YW50Cml0IHRvIGJlIGRv
bmUgZHVyaW5nIGF0b21pYyBjb21taXQgdGFpbCB3aGlsZSBhY2Nlc3MgdG8gREMgaXMgbG9ja2Vk
LgoKVG8gZ2l2ZSBhbiBleGFtcGxlLCBhIGNvbW1pdCByZXF1ZXN0aW5nIHRvIG1vZGlmeSBjb2xv
ciBtYW5hZ2VtZW50CnN0YXRlIGZvciBETSBjb3VsZCBjb21lIGluLCBiZSByZWplY3RlZCwgYnV0
IHN0aWxsIGhhdmUgbW9kaWZpZWQKdGhlIGFjdHVhbCBzeXN0ZW0gc3RhdGUgZm9yIHRoZSBzdHJl
YW0gc2luY2UgaXQncyBzaGFyZWQgbWVtb3J5LiBUaGUKbmV4dCB0aW1lIGNvbG9yIG1hbmFnZW1l
bnQgZ2V0cyBwcm9ncmFtbWVkIGl0J2xsIHVzZSB0aGUgcmVqZWN0ZWQKY29sb3IgbWFuYWdlbWVu
dCBpbmZvIC0gd2hpY2ggbWlnaHQgbm90IGV2ZW4gc3RpbGwgYmUgYXJvdW5kIGlmIGl0J3MKYSBj
dXN0b20gdHJhbnNmZXIgZnVuY3Rpb24uCgpTbyBhIHJlYXNvbmFibGUgcGxhY2UgdG8gcGVyZm9y
bSB0aGlzIGlzIHdpdGhpbiBEQyBpdHNlbGYgYW5kIHRoaXMgaXMKdGhlIG1vZGVsIHRoYXQncyBj
dXJyZW50bHkgaW4gdXNlIGZvciBzdXJmYWNlIHVwZGF0ZXMuIERDIGNhbiBldmVuCmNvbXBhcmUg
dGhlIGN1cnJlbnQgc3lzdGVtIHN0YXRlIHRvIHRoZSBpbmNvbWluZyBzdXJmYWNlIHVwZGF0ZSB0
bwpkZXRlcm1pbmUgdXBkYXRlIGxldmVsLCBzb21ldGhpbmcgdGhhdCBjYW4ndCBjdXJybmV0bHkg
YmUgZG9uZSB3aXRoIHRoZQpmcmFtZXdvcmsgZm9yIHN0cmVhbSB1cGRhdGVzLgoKW0hvd10KRHVw
bGljYXRlIHRoZSBmcmFtZXdvcmsgdXNlZCBmb3Igc3VyZmFjZSB1cGRhdGVzIGZvciBzdHJlYW0g
dXBkYXRlcwphcyB3ZWxsLiBDb3B5IGFsbCB0aGUgdXBkYXRlcyBhZnRlciBjaGVja2luZyB0aGUg
dXBkYXRlIHR5cGUuCgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xh
cy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIYXJyeSBXZW50bGFuZCA8SGFycnku
V2VudGxhbmRAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVl
dC5MYWtoYUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjLmMgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2OSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKaW5k
ZXggMGJmZjU0NmQzNzI3Li40NWI1NDJiNWQ5MjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGMuYwpAQCAtMTYwNyw2ICsxNjA3LDczIEBAIHN0YXRpYyB2b2lkIGNvcHlf
c3VyZmFjZV91cGRhdGVfdG9fcGxhbmUoCiAJCQkqc3JmX3VwZGF0ZS0+Y29lZmZfcmVkdWN0aW9u
X2ZhY3RvcjsKIH0KIAorc3RhdGljIHZvaWQgY29weV9zdHJlYW1fdXBkYXRlX3RvX3N0cmVhbShz
dHJ1Y3QgZGMgKmRjLAorCQkJCQkgc3RydWN0IGRjX3N0YXRlICpjb250ZXh0LAorCQkJCQkgc3Ry
dWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLAorCQkJCQkgY29uc3Qgc3RydWN0IGRjX3N0cmVh
bV91cGRhdGUgKnVwZGF0ZSkKK3sKKwlpZiAodXBkYXRlID09IE5VTEwgfHwgc3RyZWFtID09IE5V
TEwpCisJCXJldHVybjsKKworCWlmICh1cGRhdGUtPnNyYy5oZWlnaHQgJiYgdXBkYXRlLT5zcmMu
d2lkdGgpCisJCXN0cmVhbS0+c3JjID0gdXBkYXRlLT5zcmM7CisKKwlpZiAodXBkYXRlLT5kc3Qu
aGVpZ2h0ICYmIHVwZGF0ZS0+ZHN0LndpZHRoKQorCQlzdHJlYW0tPmRzdCA9IHVwZGF0ZS0+ZHN0
OworCisJaWYgKHVwZGF0ZS0+b3V0X3RyYW5zZmVyX2Z1bmMgJiYKKwkgICAgc3RyZWFtLT5vdXRf
dHJhbnNmZXJfZnVuYyAhPSB1cGRhdGUtPm91dF90cmFuc2Zlcl9mdW5jKSB7CisJCXN0cmVhbS0+
b3V0X3RyYW5zZmVyX2Z1bmMtPnNkcl9yZWZfd2hpdGVfbGV2ZWwgPQorCQkJdXBkYXRlLT5vdXRf
dHJhbnNmZXJfZnVuYy0+c2RyX3JlZl93aGl0ZV9sZXZlbDsKKwkJc3RyZWFtLT5vdXRfdHJhbnNm
ZXJfZnVuYy0+dGYgPSB1cGRhdGUtPm91dF90cmFuc2Zlcl9mdW5jLT50ZjsKKwkJc3RyZWFtLT5v
dXRfdHJhbnNmZXJfZnVuYy0+dHlwZSA9CisJCQl1cGRhdGUtPm91dF90cmFuc2Zlcl9mdW5jLT50
eXBlOworCQltZW1jcHkoJnN0cmVhbS0+b3V0X3RyYW5zZmVyX2Z1bmMtPnRmX3B0cywKKwkJICAg
ICAgICZ1cGRhdGUtPm91dF90cmFuc2Zlcl9mdW5jLT50Zl9wdHMsCisJCSAgICAgICBzaXplb2Yo
c3RydWN0IGRjX3RyYW5zZmVyX2Z1bmNfZGlzdHJpYnV0ZWRfcG9pbnRzKSk7CisJfQorCisJaWYg
KHVwZGF0ZS0+aGRyX3N0YXRpY19tZXRhZGF0YSkKKwkJc3RyZWFtLT5oZHJfc3RhdGljX21ldGFk
YXRhID0gKnVwZGF0ZS0+aGRyX3N0YXRpY19tZXRhZGF0YTsKKworCWlmICh1cGRhdGUtPmFibV9s
ZXZlbCkKKwkJc3RyZWFtLT5hYm1fbGV2ZWwgPSAqdXBkYXRlLT5hYm1fbGV2ZWw7CisKKwlpZiAo
dXBkYXRlLT5wZXJpb2RpY19pbnRlcnJ1cHQwKQorCQlzdHJlYW0tPnBlcmlvZGljX2ludGVycnVw
dDAgPSAqdXBkYXRlLT5wZXJpb2RpY19pbnRlcnJ1cHQwOworCisJaWYgKHVwZGF0ZS0+cGVyaW9k
aWNfaW50ZXJydXB0MSkKKwkJc3RyZWFtLT5wZXJpb2RpY19pbnRlcnJ1cHQxID0gKnVwZGF0ZS0+
cGVyaW9kaWNfaW50ZXJydXB0MTsKKworCWlmICh1cGRhdGUtPmdhbXV0X3JlbWFwKQorCQlzdHJl
YW0tPmdhbXV0X3JlbWFwX21hdHJpeCA9ICp1cGRhdGUtPmdhbXV0X3JlbWFwOworCisJLyogTm90
ZTogdGhpcyBiZWluZyB1cGRhdGVkIGFmdGVyIG1vZGUgc2V0IGlzIGN1cnJlbnRseSBub3QgYSB1
c2UgY2FzZQorCSAqIGhvd2V2ZXIgaWYgaXQgYXJpc2VzIE9DU0Mgd291bGQgbmVlZCB0byBiZSBy
ZXByb2dyYW1tZWQgYXQgdGhlCisJICogbWluaW11bQorCSAqLworCWlmICh1cGRhdGUtPm91dHB1
dF9jb2xvcl9zcGFjZSkKKwkJc3RyZWFtLT5vdXRwdXRfY29sb3Jfc3BhY2UgPSAqdXBkYXRlLT5v
dXRwdXRfY29sb3Jfc3BhY2U7CisKKwlpZiAodXBkYXRlLT5vdXRwdXRfY3NjX3RyYW5zZm9ybSkK
KwkJc3RyZWFtLT5jc2NfY29sb3JfbWF0cml4ID0gKnVwZGF0ZS0+b3V0cHV0X2NzY190cmFuc2Zv
cm07CisKKwlpZiAodXBkYXRlLT52cnJfaW5mb3BhY2tldCkKKwkJc3RyZWFtLT52cnJfaW5mb3Bh
Y2tldCA9ICp1cGRhdGUtPnZycl9pbmZvcGFja2V0OworCisJaWYgKHVwZGF0ZS0+ZHBtc19vZmYp
CisJCXN0cmVhbS0+ZHBtc19vZmYgPSAqdXBkYXRlLT5kcG1zX29mZjsKKworCWlmICh1cGRhdGUt
PnZzY19pbmZvcGFja2V0KQorCQlzdHJlYW0tPnZzY19pbmZvcGFja2V0ID0gKnVwZGF0ZS0+dnNj
X2luZm9wYWNrZXQ7CisKKwlpZiAodXBkYXRlLT52c3BfaW5mb3BhY2tldCkKKwkJc3RyZWFtLT52
c3BfaW5mb3BhY2tldCA9ICp1cGRhdGUtPnZzcF9pbmZvcGFja2V0OworCisJaWYgKHVwZGF0ZS0+
ZGl0aGVyX29wdGlvbikKKwkJc3RyZWFtLT5kaXRoZXJfb3B0aW9uID0gKnVwZGF0ZS0+ZGl0aGVy
X29wdGlvbjsKK30KKwogc3RhdGljIHZvaWQgY29tbWl0X3BsYW5lc19kb19zdHJlYW1fdXBkYXRl
KHN0cnVjdCBkYyAqZGMsCiAJCXN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSwKIAkJc3Ry
dWN0IGRjX3N0cmVhbV91cGRhdGUgKnN0cmVhbV91cGRhdGUsCkBAIC0xODU3LDYgKzE5MjQsOCBA
QCB2b2lkIGRjX2NvbW1pdF91cGRhdGVzX2Zvcl9zdHJlYW0oc3RydWN0IGRjICpkYywKIAkJfQog
CX0KIAorCWNvcHlfc3RyZWFtX3VwZGF0ZV90b19zdHJlYW0oZGMsIGNvbnRleHQsIHN0cmVhbSwg
c3RyZWFtX3VwZGF0ZSk7CisKIAljb21taXRfcGxhbmVzX2Zvcl9zdHJlYW0oCiAJCQkJZGMsCiAJ
CQkJc3JmX3VwZGF0ZXMsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
