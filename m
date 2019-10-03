Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED34DCA0AC
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470C189D84;
	Thu,  3 Oct 2019 14:55:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F07889CDD
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 14:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYzJ4Ab73q+i83/gSbqUzvXgXz/jHJvAm2IScjIAAupkmQOOhNXhW6b/7ZgqNRBl/gC/1SLvmeP/B2Dn8MXuiv1lT88JLImX5qctk3wPVrfucK9Jl+7eeTaUKh8ksFoKTN27WlPGERBj9TuHtzuOHeSHRdKtxgXMDvvuZtA71ahPhmK12loez1Bi1owLPIUKjUZbmZWfcasYaNa36xtOi5CxPKUFEXgkai7gXbzknYmiMzrbrZbtGcq3zisB9RukpS8UEKfae4X3NyAw0gMW855U31P/AcGKkXRj+wz67VYejyqfLIPrJIx5StPW5dcz3tDg/OIQ6+xh6bQyZfYAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se85UJ2Ga9iUzzlf9wYohc7uQ5N89KGoNqUNwX2ihSs=;
 b=fiNesSVcEywOtiuWpYJacMULMzTXUfdaDEJU77gx2GkrVk3fXyJ8Zd+yvK1st9VT5TzZbryqY7pbObd5QdrL/v0VtCWoU4sfUuLd0UO18v1aojBbuEwOK33gK8x7wL5DeXglSJxkj6O/iy3pYgAV5xNPVR3fpjrdC0/bVTUpG0L0Q/3Il1rk5wwJFE+FhyGnzQ2ZU69OX0O0ZV6/3+UIjDIyTOYHisETgSgAj3QLc+k5rYua8v1Hj146AKtqRLPT8ihCrKH01QpdQiMgyuTiS+yZVAJgYt+GZ52KdrQQoDyKVMdiH2Vh62y4D0RcQKnNoZbC+5Vs5esBhGelDZhCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0012.namprd12.prod.outlook.com (2603:10b6:403:2::22)
 by BN6PR12MB1554.namprd12.prod.outlook.com (2603:10b6:405:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Thu, 3 Oct
 2019 14:54:56 +0000
Received: from BY2NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by BN4PR12CA0012.outlook.office365.com
 (2603:10b6:403:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.16 via Frontend
 Transport; Thu, 3 Oct 2019 14:54:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT045.mail.protection.outlook.com (10.152.85.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Thu, 3 Oct 2019 14:54:55 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 3 Oct 2019
 09:54:55 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <harry.wentland@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/11] HDCP 2 Content Protection
Date: Thu, 3 Oct 2019 10:54:30 -0400
Message-ID: <20191003145441.28952-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(346002)(428003)(199004)(189003)(26005)(426003)(336012)(186003)(36756003)(486006)(126002)(4326008)(356004)(2616005)(6666004)(476003)(86362001)(50466002)(1076003)(48376002)(53416004)(305945005)(7696005)(51416003)(5660300002)(478600001)(2906002)(8676002)(70206006)(81156014)(81166006)(50226002)(8936002)(316002)(16586007)(110136005)(14444005)(70586007)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1554; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce93f3a-000e-4e44-65e4-08d74811a775
X-MS-TrafficTypeDiagnostic: BN6PR12MB1554:
X-Microsoft-Antispam-PRVS: <BN6PR12MB15543CB3E49C416335022BCAF99F0@BN6PR12MB1554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 01792087B6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sAtS1OvOBTiV/WXnfsdp2NnjyIcdvoF3DTmQRH7TaYhO2FOYWL2GW5jcUvIKYXQ2JxeHPP5CSowm7l8CF6AJ3KXaUhyyAL1CPCHD8TP1MXjALdAbAXOrmEa4UF2aOnWAUQJ5TWxVSYV3j4U31uq6h1HsW6FWPv0tP62dkqg/sEgveODrsAK26/y/xOwvn0yFUlUwk7oOll+VK66NQco8HklseuT+t8/Dclogkglf0nj7EBlUXs2RF9wkkuZ64bKFGCkyYSxU1MPZnkQYVfadHH4ui7l3vKrpr34XyUpUEsGWUwtV88ApEWxVS4JT3HnjsSqKS9EeBsEj/H/qXoqk6Vknhm6Di5aO9yqO53SJYY+6tJOthqUEBG90RlHCX2JninQNmfbXcl4DejCdbn5lU7BhmUN53oVsTYgpgf5lz/Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2019 14:54:55.5716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce93f3a-000e-4e44-65e4-08d74811a775
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1554
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se85UJ2Ga9iUzzlf9wYohc7uQ5N89KGoNqUNwX2ihSs=;
 b=DPp9Jv+EJDSKAUQ2PiT6yE1CBHLWa8MNT5ogoc9o2bW6ryDwRt1EC2JlyluP2xBdPs5SJjyvFl8BCSlvkaGAT0S2DqsbA632RnVdjWR/5vLztqCF6rsDt3msqLXUOAewPQgCIyiFicujkM5U2RBKdqZzRIgy/IVmLilWoF89PBI=
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

SnVzdCBsaWtlIHdpdGggdGhlIDEuNCBzZXJpZXMgb2YgcGF0Y2hlcyBUaGlzIG9ubHkgaW50cm9k
dWNlcyB0aGUKYWJpbGl0eSB0byBhdXRoZW50aWNhdGUgYW5kIGVuY3J5cHQgdGhlIGxpbmsuIFRo
ZXNlIHBhdGNoZXMgYnkKdGhlbXNlbHZlcyBkb24ndCBjb25zdGl0dXRlIGEgY29tcGxldGUgYW5k
IGNvbXBsaWFudCBIRENQIGNvbnRlbnQKcHJvdGVjdGlvbiBzb2x1dGlvbiBidXQgYXJlIGEgcmVx
dWlyZW1lbnQgZm9yIHN1Y2ggYSBzb2x1dGlvbi4KClN1bW1hcnkgb2YgdGhlIGNoYW5nZXMKKkFk
ZHMgMi4yIGNvZGUgdG8gdGhlIG1vZHVsZQoqRW5hYmxlZCBIRENQIDIuMiBhdXRoZW50aWNhdGlv
bi9lbmNyeXB0aW9uCipBZGQgdHlwZTAvMSBzZWxlY3Rpb24gZm9yIDIuMgoqQWRkIE1TVCBzdXBw
b3J0IChPbmx5IHRlc3RlZCBzaW5nbGUgZGFpc3kgY2hhaW4gdXNlY2FzZSkKCkJoYXdhbnByZWV0
IExha2hhICgxMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgUFNQIGJsb2NrIHRvIHZlcmlmeSBI
RENQMi4yIHN0ZXBzCiAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgRERDIGhhbmRsZXMgZm9yIEhEQ1Ay
LjIKICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBleGVjdXRpb24gYW5kIHRyYW5zaXRpb24gc3RhdGVz
IGZvciBIRENQMi4yCiAgZHJtL2FtZC9kaXNwbGF5OiBBZGQgbG9nZ2luZyBmb3IgSERDUDIuMgog
IGRybS9hbWQvZGlzcGxheTogQ2hhbmdlIEVSUk9SIHRvIFdBUk4gZm9yIEhEQ1AgbW9kdWxlCiAg
ZHJtL2FtZC9kaXNwbGF5OiBFbmFibGUgSERDUCAyLjIKICBkcm0vYW1kL2Rpc3BsYXk6IEhhbmRs
ZSBoZGNwMi4yIHR5cGUwLzEgaW4gZG0KICBkcm0vYW1kL2Rpc3BsYXk6IFJlZmFjdG9yIEhEQ1Ag
dG8gaGFuZGxlIG11bHRpcGxlIGRpc3BsYXlzIHBlciBsaW5rCiAgZHJtL2FtZC9kaXNwbGF5OiBh
ZGQgZm9yY2UgVHlwZTAvMSBmbGFnCiAgZHJtL2FtZC9kaXNwbGF5OiBSZWZhY3RvciBIRENQIGVu
Y3J5cHRpb24gc3RhdHVzIHVwZGF0ZQogIGRybS9hbWQvZGlzcGxheTogZml4IGV2ZW50cyBoYW5k
bGluZyBmb3IgaGRjcAoKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYyB8ICAyNiArLQogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGRjcC5j
ICAgIHwgIDc5ICstCiAuLi4vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZGNwLmgg
ICAgfCAgIDkgKy0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvaGRjcC9NYWtlZmls
ZSB8ICAgMyArLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AuYyAg
IHwgMTAxICstCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5oICAg
fCAxNzEgKysrKwogLi4uL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AyX2V4ZWN1dGlvbi5jICAg
IHwgODgxICsrKysrKysrKysrKysrKysrKwogLi4uL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3Ay
X3RyYW5zaXRpb24uYyAgIHwgNjc0ICsrKysrKysrKysrKysrCiAuLi4vZHJtL2FtZC9kaXNwbGF5
L21vZHVsZXMvaGRjcC9oZGNwX2RkYy5jICAgfCAzMjYgKysrKysrKwogLi4uL2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL2hkY3AvaGRjcF9sb2cuYyAgIHwgMTE4ICsrKwogLi4uL2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL2hkY3AvaGRjcF9sb2cuaCAgIHwgIDk4ICstCiAuLi4vZHJtL2FtZC9kaXNw
bGF5L21vZHVsZXMvaGRjcC9oZGNwX3BzcC5jICAgfCA1MTEgKysrKysrKysrLQogLi4uL2RybS9h
bWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9wc3AuaCAgIHwgMTk0ICsrKysKIC4uLi9kcm0v
YW1kL2Rpc3BsYXkvbW9kdWxlcy9pbmMvbW9kX2hkY3AuaCAgICB8ICAxNSArLQogMTQgZmlsZXMg
Y2hhbmdlZCwgMzEyNSBpbnNlcnRpb25zKCspLCA4MSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hkY3AyX2V4
ZWN1dGlvbi5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L21vZHVsZXMvaGRjcC9oZGNwMl90cmFuc2l0aW9uLmMKCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
