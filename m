Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59B38EC3
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 17:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3727892BB;
	Fri,  7 Jun 2019 15:17:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFB1892BB
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 15:17:01 +0000 (UTC)
Received: from BN4PR12CA0021.namprd12.prod.outlook.com (2603:10b6:403:2::31)
 by DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1943.22; Fri, 7 Jun
 2019 15:16:59 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by BN4PR12CA0021.outlook.office365.com
 (2603:10b6:403:2::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.15 via Frontend
 Transport; Fri, 7 Jun 2019 15:16:59 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Fri, 7 Jun 2019 15:16:59 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 7 Jun 2019
 10:16:58 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true
Date: Fri, 7 Jun 2019 11:16:55 -0400
Message-ID: <20190607151655.7991-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(428003)(199004)(189003)(70206006)(316002)(7696005)(70586007)(51416003)(186003)(478600001)(15650500001)(50226002)(54906003)(336012)(126002)(53416004)(68736007)(2351001)(81166006)(8936002)(81156014)(36756003)(86362001)(6666004)(356004)(50466002)(72206003)(8676002)(5660300002)(305945005)(6916009)(1076003)(44832011)(16586007)(476003)(53936002)(2906002)(486006)(26005)(48376002)(77096007)(47776003)(14444005)(426003)(2616005)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0058; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d5a639b-0fb3-4743-e68a-08d6eb5b2fa9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0058; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0058C18263BA294B2EF6AEE8EC100@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0061C35778
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: sdS/hy8IefYXWsKgHvz1OdQ9wP9xznZBt8ppXleZmJwXV2uYAP7OP5OgrZVage4ENEq0O35guAwA2F3sw3uj/VGX3t0M75dDPZbLiSxxPBj7NPzQS6bn8l9x3ERtTapoT8qdoPp+e5WMrwYLR+lydDqegTRgoqyjfJn6z6RlMvNU66y1qA5UY6TULQVc2c5+19Xg0/czXq4eHu4VviBSgE5tE4EMz70SdP2OxgDbT55XGKAF2FWTyvVz4Kx77/KR8EsPCLVIYsazr3IwFef8/VXF3iCkF5YtLBL4W6EKGvFr779sKIgfJzrMIjzUzYaHsyTSsmhx1RgvKQD5D1zp82bAtP5A45zQnlpiNluJ+/VzyAbGZ0mASXZgKysaWKlafmoQbM21FkR4CXRAlLbX/SlFkoc6mISBn8BUG+BQVN8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2019 15:16:59.2628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d5a639b-0fb3-4743-e68a-08d6eb5b2fa9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=go/UCvAHLM6kGJG+wLK6OuiJyIYDkeO0WOjCSKJZoF0=;
 b=k8XNqk4zznauQeEi8ppMrOa/lqTo07mIq+5KR30suv2fbV17hnpuRfcC1JTTv2KeDAm0xftUOh5MmOPIetg5DO6RUGz1ZM48n56Soc1ezUlJJoKeH/fnas/9PHdKAT47aGT3/71lW50Apu4Lk/9AG+kXerADcizMhAsUc2UNumA=
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
Cc: David Francis <david.francis@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2hlbmV2ZXIgdGhlIGEgbW9kZXNldCBpcyBhbGxvd2VkIChidXQgbm90IG5lY2Nlc3Nh
cmlseSByZXF1aXJlZCkgd2UKY3VycmVudGx5IHJlY3JlYXRlIGFsbCB0aGUgcGxhbmVzIGluIHRo
ZSBzdGF0ZS4gTW9zdCBJR1QgdGVzdHMgYW5kCmxlZ2FjeSBJT0NUTHMgY3JlYXRlIGF0b21pYyBj
b21taXRzIHdpdGggdGhpcyBmbGFnIHNldCwgc28gdGhlIHBpcGVzCmFyZSBvZnRlbiB1bm5lY2Vz
c2FyaWx5IHJlcHJvZ3JhbW1lZC4KClBvb3IgcGVyZm9ybWFuY2UgYW5kIHN0dXR0ZXJpbmcgY2Fu
IG9jY3VyIHdoZW4gbWFueSBvZiB0aGVzZSBjb21taXRzCmFyZSBmcmVxdWVudGx5IGlzc3VlZC4K
ClRoaXMgZmxhZyB3YXMgbmVlZGVkIHdoZW4gdGhlIGFwcHJvcHJpYXRlIGNvbmRpdGlvbnMgZm9y
IGNoZWNraW5nCndoZXRoZXIgdGhlIHBsYW5lcyBuZWVkZWQgYSByZXNldCB3ZXJlIG5vdCBpbiBw
bGFjZSwgYnV0CnNob3VsZF9yZXNldF9wbGFuZSBzaG91bGQgY292ZXIgZXZlcnl0aGluZyBuZWVk
ZWQgbm93LgoKW0hvd10KRHJvcCB0aGUgY2hlY2sgZm9yIHN0YXRlLT5hbGxvd19tb2Rlc2V0IGlu
IHNob3VsZF9yZXNldF9wbGFuZS4KCkFsbCBwbGFuZXMgb24gYSBDUlRDIHNob3VsZCByZXNldCBp
biB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6Ci0gVGhlIENSVEMgbmVlZHMgYSBtb2Rlc2V0Ci0g
VGhlIENSVEMgZGVnYW1tYSBjaGFuZ2VzCi0gUGxhbmVzIGFyZSBhZGRlZCBvciByZW1vdmVkIHRv
IHRoZSBDUlRDCgpUaGVzZSBjb25kaXRpb25zIGFyZSBhbGwgY292ZXJlZCBpbiBzaG91bGRfcmVz
ZXRfcGxhbmUuCgpXZSBzdGlsbCBjYW4ndCBkcm9wIHRoZSBmb3JtYXQgY2hhbmdlIGNoZWNrIGlu
IHNob3VsZF9yZXNldF9wbGFuZSBzaW5jZQpmaWxsX2RjX3BsYW5lX2luZm9fYW5kX2FkZHIgaXNu
J3QgY2FsbGVkIHdoZW4gdmFsaWRhdGluZyB0aGUgc3RhdGUsIHNvCndlIGNhbid0IHRlbGwgaWYg
YSBGVUxMIHVwZGF0ZSBpcyBuZWVkZWQgb3Igbm90LgoKQ2M6IERhdmlkIEZyYW5jaXMgPGRhdmlk
LmZyYW5jaXNAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVz
a2FzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYyB8IDggLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CmluZGV4IGE2OThjOGYyNzJlZC4uNDVmMGQ1YjZjNDY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTY0NDYsMTQgKzY0NDYs
NiBAQCBzdGF0aWMgYm9vbCBzaG91bGRfcmVzZXRfcGxhbmUoc3RydWN0IGRybV9hdG9taWNfc3Rh
dGUgKnN0YXRlLAogCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGU7CiAJaW50
IGk7CiAKLQkvKgotCSAqIFRPRE86IFJlbW92ZSB0aGlzIGhhY2sgb25jZSB0aGUgY2hlY2tzIGJl
bG93IGFyZSBzdWZmaWNpZW50Ci0JICogZW5vdWdoIHRvIGRldGVybWluZSB3aGVuIHdlIG5lZWQg
dG8gcmVzZXQgYWxsIHRoZSBwbGFuZXMgb24KLQkgKiB0aGUgc3RyZWFtLgotCSAqLwotCWlmIChz
dGF0ZS0+YWxsb3dfbW9kZXNldCkKLQkJcmV0dXJuIHRydWU7Ci0KIAkvKiBFeGl0IGVhcmx5IGlm
IHdlIGtub3cgdGhhdCB3ZSdyZSBhZGRpbmcgb3IgcmVtb3ZpbmcgdGhlIHBsYW5lLiAqLwogCWlm
IChvbGRfcGxhbmVfc3RhdGUtPmNydGMgIT0gbmV3X3BsYW5lX3N0YXRlLT5jcnRjKQogCQlyZXR1
cm4gdHJ1ZTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
