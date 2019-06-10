Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13403B578
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 14:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845318911F;
	Mon, 10 Jun 2019 12:57:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720045.outbound.protection.outlook.com [40.107.72.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CFC28911F
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 12:57:53 +0000 (UTC)
Received: from BN8PR12CA0011.namprd12.prod.outlook.com (2603:10b6:408:60::24)
 by SN6PR12MB2670.namprd12.prod.outlook.com (2603:10b6:805:6f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.17; Mon, 10 Jun
 2019 12:57:42 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by BN8PR12CA0011.outlook.office365.com
 (2603:10b6:408:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.15 via Frontend
 Transport; Mon, 10 Jun 2019 12:57:42 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Mon, 10 Jun 2019 12:57:41 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 10 Jun 2019
 07:57:40 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Allow cursor async updates for framebuffer
 swaps
Date: Mon, 10 Jun 2019 08:57:39 -0400
Message-ID: <20190610125739.29259-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(396003)(346002)(2980300002)(428003)(199004)(189003)(8936002)(5660300002)(50226002)(36756003)(336012)(2616005)(70586007)(70206006)(1076003)(44832011)(426003)(53936002)(126002)(4326008)(72206003)(47776003)(81166006)(81156014)(486006)(478600001)(15650500001)(476003)(8676002)(305945005)(2351001)(68736007)(26005)(6916009)(77096007)(14444005)(356004)(186003)(48376002)(16586007)(53416004)(316002)(50466002)(86362001)(7696005)(51416003)(54906003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2670; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01487127-09c5-4d26-fb78-08d6eda3396f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2670; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2670:
X-Microsoft-Antispam-PRVS: <SN6PR12MB267067A42E8ED64A636318C8EC130@SN6PR12MB2670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0064B3273C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XLeSeHp9/jWU0gXHbHzgBNKMb1+MDTDBAyoMbu1e7aTRU+b4J/MIXyXuR7Et5acHKnfq+NvYZhp7h/frwmWJ4DTZAWbRGgIaUM77cr/MHohm2JNYHMNDi2PxwOKwhfurNGyfM/CUE+mlco9I/70dXoXXn4GT5vK6ZM9izjy4fV6+QThP/sam1QfEPW+NAg91a4DbMcxybFwhs9AzcFC8CdTNbT9n5fqCPz08/Xb50lhC8/YQJX0KcUPXiuOQV59C2Ml1jv23t5Q+HQIsoa+n0xj7i/USI/8jehw3YcwiwUGiyE61CIUNSBwwmnfyMlBcgJCXSkpGy87nCO0+xUhP4mtOVW4pMsRCRKvGsbRqsbWzAnOu34yqp9uSjpvKBEzPywgFV8llUGzRzpKNCap0HBfz5uIVUJkemw6TWx4UmPU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2019 12:57:41.6644 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01487127-09c5-4d26-fb78-08d6eda3396f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2670
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEF4PX8KRhmoXMlh3EjU8TwNp3RDQwYigoCef7HZovA=;
 b=g/CQFunSnCGCB7ez3sc4YbMmLrpGj8frB6T80FCncZFyvQHCPJSVIrkA3qhOgokKCQ9JOSWq65jCfnnbzvy+o/vz/jVn7y2aMTRqq3NAsH2JqrhFoBeQZPGRZbXo4f8a3obii3AGFu9xsRdO1NDYYlnaGSpP5k5Fzl8sJl+Ud8c=
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

W1doeV0KV2UgcHJldmlvdXNseSBhbGxvd2VkIGZyYW1lYnVmZmVyIHN3YXBzIGFzIGFzeW5jIHVw
ZGF0ZXMgZm9yIGN1cnNvcgpwbGFuZXMgYnV0IGhhZCB0byBkaXNhYmxlIHRoZW0gZHVlIHRvIGEg
YnVnIGluIERSTSB3aXRoIGFzeW5jIHVwZGF0ZQpoYW5kbGluZyBhbmQgaW5jb3JyZWN0IHJlZiBj
b3VudGluZy4gVGhlIGNoZWNrIHRvIGJsb2NrIGZyYW1lYnVmZmVyCnN3YXBzIGhhcyBiZWVuIGFk
ZGVkIHRvIERSTSBmb3IgYSB3aGlsZSBub3csIHNvIHRoaXMgY2hlY2sgaXMgcmVkdW5kYW50LgoK
VGhlIHJlYWwgZml4IHRoYXQgYWxsb3dzIHRoaXMgdG8gcHJvcGVybHkgaW4gRFJNIGhhcyBhbHNv
IGZpbmFsbHkgYmVlbgptZXJnZWQgYW5kIGlzIGdldHRpbmcgYmFja3BvcnRlZCBpbnRvIHN0YWJs
ZSBicmFuY2hlcywgc28gZHJvcHBpbmcKdGhpcyBub3cgc2VlbXMgdG8gYmUgdGhlIHJpZ2h0IHRp
bWUgdG8gZG8gc28uCgpbSG93XQpEcm9wIHRoZSByZWR1bmRhbnQgY2hlY2sgZm9yIG9sZF9mYiAh
PSBuZXdfZmIuCgpXaXRoIHRoZSBwcm9wZXIgZml4IGluIERSTSwgdGhpcyBzaG91bGQgYWxzbyBm
aXggc29tZSBjdXJzb3Igc3R1dHRlcmluZwppc3N1ZXMgd2l0aCB4Zjg2LXZpZGVvLWFtZGdwdSBz
aW5jZSBpdCBkb3VibGUgYnVmZmVycyB0aGUgY3Vyc29yLgoKSUdUIHRlc3RzIHRoYXQgc3dhcCBm
cmFtZWJ1ZmZlcnMgKC12YXJ5aW5nLXNpemUgZm9yIGV4YW1wbGUpIHNob3VsZAphbHNvIHBhc3Mg
YWdhaW4uCgpDYzogRGF2aWQgRnJhbmNpcyA8ZGF2aWQuZnJhbmNpc0BhbWQuY29tPgpDYzogSGFy
cnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY2hv
bGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTAgLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDQ1ZjBkNWI2YzQ2OC4u
MTAwYjJjNjBmZjFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTQzMTUsMjAgKzQzMTUsMTAgQEAgc3RhdGljIGludCBkbV9w
bGFuZV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiBzdGF0aWMgaW50IGRt
X3BsYW5lX2F0b21pY19hc3luY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAkJCQkg
ICAgICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRlKQogewotCXN0cnVj
dCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9wbGFuZV9zdGF0ZSA9Ci0JCWRybV9hdG9taWNfZ2V0X29s
ZF9wbGFuZV9zdGF0ZShuZXdfcGxhbmVfc3RhdGUtPnN0YXRlLCBwbGFuZSk7Ci0KIAkvKiBPbmx5
IHN1cHBvcnQgYXN5bmMgdXBkYXRlcyBvbiBjdXJzb3IgcGxhbmVzLiAqLwogCWlmIChwbGFuZS0+
dHlwZSAhPSBEUk1fUExBTkVfVFlQRV9DVVJTT1IpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JLyoK
LQkgKiBEUk0gY2FsbHMgcHJlcGFyZV9mYiBhbmQgY2xlYW51cF9mYiBvbiBuZXdfcGxhbmVfc3Rh
dGUgZm9yCi0JICogYXN5bmMgY29tbWl0cyBzbyBkb24ndCBhbGxvdyBmYiBjaGFuZ2VzLgotCSAq
LwotCWlmIChvbGRfcGxhbmVfc3RhdGUtPmZiICE9IG5ld19wbGFuZV9zdGF0ZS0+ZmIpCi0JCXJl
dHVybiAtRUlOVkFMOwotCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
