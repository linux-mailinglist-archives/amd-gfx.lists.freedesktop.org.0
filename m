Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50606FAD7
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 10:01:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F4289BF5;
	Mon, 22 Jul 2019 08:01:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700072.outbound.protection.outlook.com [40.107.70.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9589BF5
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 08:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYeRECPshCUMkn/JuPS//dcs66uVxU3eLcvUpyO17FYgOF+Yn5Ll7uQe6l6rNaU1W411bZpX9lq0P8XzT9xKbUsIvPnkBgB652Whb+SDx21gCxEkcotqEqK++9Hu0R/htL9ePl0s0e6KYTltJ1BOY8CWhjffjtBjEaXS7odqzzs2vbhHOKKXDgzFwVyOtK6VSUaT+MAHA2vUufSl82cQn6LuMT5DgN2Uzulw8oeXN1NAuNi7g4fj8Z1J9Oen4ecNBE3Kva7qHH4kVo2l7ABa7fGplUegd3Mh/bM8WCM+EqgFENcT8CRBMnbleBPD8Dn+zBPWzpOMoIHXAQDb2oSDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjLRqPJNgiIbRNo9x+dMqggM1A/bQ2AmsqwLVdpoRIo=;
 b=ex+mWHunGiudjKxUy5HQ40/xg5ZyftbVbzh5qn4aDKrs60P98fczZ2Q0Jika+9c0O2FUXGaOzCyDIF+DD5J+/C/zZckxHw4k704cchM7MQvmEK1gULrPoHUs/EAJ5SDwknDSc7kvSwalxCD0S5LDnzupM16GcERP4rXkTPDtifIo/nSWu6PevgVS30pCIStp7ctQYifw9hM8Al/9suBKBVeFLVybv7yWeDtZ/f46uezjggGuaueK9pq3iq2YmWpyDl7mFF6vgSpcGYjf4mT1gQx5rDtVnpghIX9F2UuYraDN/M44myOxcX/32G2wnEnleMNsaCYUksW1N3f26lUmIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0059.namprd12.prod.outlook.com (2603:10b6:3:103::21)
 by CY4PR1201MB2486.namprd12.prod.outlook.com (2603:10b6:903:d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.16; Mon, 22 Jul
 2019 08:01:25 +0000
Received: from BY2NAM03FT018.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by DM5PR12CA0059.outlook.office365.com
 (2603:10b6:3:103::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.16 via Frontend
 Transport; Mon, 22 Jul 2019 08:01:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT018.mail.protection.outlook.com (10.152.84.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 22 Jul 2019 08:01:24 +0000
Received: from localhost.localdomain (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Mon, 22 Jul 2019
 03:01:23 -0500
From: Le Ma <le.ma@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH libdrm 1/1] tests/amdgpu: divide dispatch test into compute
 and gfx
Date: Mon, 22 Jul 2019 16:01:14 +0800
Message-ID: <1563782474-32675-1-git-send-email-le.ma@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(2980300002)(428003)(189003)(199004)(81166006)(305945005)(356004)(6666004)(51416003)(426003)(26005)(5660300002)(2616005)(53936002)(68736007)(36756003)(2906002)(336012)(81156014)(86362001)(8936002)(126002)(70586007)(2351001)(16586007)(47776003)(316002)(50226002)(4326008)(476003)(50466002)(48376002)(70206006)(186003)(54906003)(478600001)(49486002)(486006)(44832011)(6916009)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2486; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95bf40f7-8b1e-4d33-61ca-08d70e7acafa
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB2486; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2486:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB2486856BD21BBE4B6B3CECD1F6C40@CY4PR1201MB2486.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 01068D0A20
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: RmrEdY9QCOe5wr6MhX145+AFhIg8+yRh/Cq6PlQgwzqHADyBefN9eHZN1qc/RSr3trkyktPUziQfC/z0BwWxRYBEROIMNJzKhdOvbuE+ftqxPeUhcfzRrkOg7K2dvhcQbpB1dpgM2t2bNJvS2zjfKb+kLSPvhiCD6BgD0cnBw8li2WjodOR+cXBjteN/RgJCCAJU0cS3zMonOQ++uF1LPiB+gQyr4DvegWOPIuAnWvbsioSyD57Xf/6p5R4eS0X4JOxEablRQFyngaKFCy0QIsX1+AdqIOnI0lCkGUHzzuL1/JDKq3ZF9Wnw3M/lk9N1uASeY3rr4Oy914jLaeoGe9XAfI6xZm5QIO+0/t6zKlHyvuUPf/8ve5/Z7wAzAvhgIf7pmSUo3LG7FPCRmc1f7+8tALf5Rpf65bCQy8oIV8s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2019 08:01:24.8888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bf40f7-8b1e-4d33-61ca-08d70e7acafa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2486
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjLRqPJNgiIbRNo9x+dMqggM1A/bQ2AmsqwLVdpoRIo=;
 b=086ctYOKdJhQknXFR6UttqIKjUIhuZsBuYMvtGRt6hFMFAs/MaH7oT+wFR3qQXqefq/IynclGEf4FwfFW1xzCgcaLp8GJflkrJ6CNFEhSHmY784oDo5kssP95gJeEGzLVo8tnocbjLPg9riuQtSOYDhIRoNf1a+/7QyTBmcQhWs=
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
Cc: Le Ma <le.ma@amd.com>, flora.cui@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zm9yIGJldHRlciBjbGFyaWZpY2F0aW9uCgpDaGFuZ2UtSWQ6IEkyNDVkNzYwZDVmOWQ2NGViMTBi
MTM3ZDVjZTM3NWVmNTJhNGQ4NzNhClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29t
PgotLS0KIHRlc3RzL2FtZGdwdS9iYXNpY190ZXN0cy5jIHwgMTYgKysrKysrKysrKysrKy0tLQog
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdHMvYW1kZ3B1L2Jhc2ljX3Rlc3RzLmMgYi90ZXN0cy9hbWRncHUvYmFzaWNfdGVz
dHMuYwppbmRleCA5MzgxMDZlLi5mYTBmNTY4IDEwMDY0NAotLS0gYS90ZXN0cy9hbWRncHUvYmFz
aWNfdGVzdHMuYworKysgYi90ZXN0cy9hbWRncHUvYmFzaWNfdGVzdHMuYwpAQCAtNTUsNyArNTUs
OCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdXNlcnB0cl90ZXN0KHZvaWQpOwogc3RhdGljIHZvaWQg
YW1kZ3B1X3NlbWFwaG9yZV90ZXN0KHZvaWQpOwogc3RhdGljIHZvaWQgYW1kZ3B1X3N5bmNfZGVw
ZW5kZW5jeV90ZXN0KHZvaWQpOwogc3RhdGljIHZvaWQgYW1kZ3B1X2JvX2V2aWN0aW9uX3Rlc3Qo
dm9pZCk7Ci1zdGF0aWMgdm9pZCBhbWRncHVfZGlzcGF0Y2hfdGVzdCh2b2lkKTsKK3N0YXRpYyB2
b2lkIGFtZGdwdV9jb21wdXRlX2Rpc3BhdGNoX3Rlc3Qodm9pZCk7CitzdGF0aWMgdm9pZCBhbWRn
cHVfZ2Z4X2Rpc3BhdGNoX3Rlc3Qodm9pZCk7CiBzdGF0aWMgdm9pZCBhbWRncHVfZHJhd190ZXN0
KHZvaWQpOwogc3RhdGljIHZvaWQgYW1kZ3B1X2dwdV9yZXNldF90ZXN0KHZvaWQpOwogCkBAIC03
OSw3ICs4MCw4IEBAIENVX1Rlc3RJbmZvIGJhc2ljX3Rlc3RzW10gPSB7CiAJeyAiQ29tbWFuZCBz
dWJtaXNzaW9uIFRlc3QgKFNETUEpIiwgYW1kZ3B1X2NvbW1hbmRfc3VibWlzc2lvbl9zZG1hIH0s
CiAJeyAiU1cgc2VtYXBob3JlIFRlc3QiLCAgYW1kZ3B1X3NlbWFwaG9yZV90ZXN0IH0sCiAJeyAi
U3luYyBkZXBlbmRlbmN5IFRlc3QiLCAgYW1kZ3B1X3N5bmNfZGVwZW5kZW5jeV90ZXN0IH0sCi0J
eyAiRGlzcGF0Y2ggVGVzdCIsICBhbWRncHVfZGlzcGF0Y2hfdGVzdCB9LAorCXsgIkRpc3BhdGNo
IFRlc3QgKENvbXB1dGUpIiwgIGFtZGdwdV9jb21wdXRlX2Rpc3BhdGNoX3Rlc3QgfSwKKwl7ICJE
aXNwYXRjaCBUZXN0IChHRlgpIiwgIGFtZGdwdV9nZnhfZGlzcGF0Y2hfdGVzdCB9LAogCXsgIkRy
YXcgVGVzdCIsICBhbWRncHVfZHJhd190ZXN0IH0sCiAJeyAiR1BVIHJlc2V0IFRlc3QiLCBhbWRn
cHVfZ3B1X3Jlc2V0X3Rlc3QgfSwKIAlDVV9URVNUX0lORk9fTlVMTCwKQEAgLTI0NDgsNyArMjQ1
MCw4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9tZW1jcHlfZGlzcGF0Y2hfdGVzdChhbWRncHVfZGV2
aWNlX2hhbmRsZSBkZXZpY2VfaGFuZGxlLAogCXIgPSBhbWRncHVfY3NfY3R4X2ZyZWUoY29udGV4
dF9oYW5kbGUpOwogCUNVX0FTU0VSVF9FUVVBTChyLCAwKTsKIH0KLXN0YXRpYyB2b2lkIGFtZGdw
dV9kaXNwYXRjaF90ZXN0KHZvaWQpCisKK3N0YXRpYyB2b2lkIGFtZGdwdV9jb21wdXRlX2Rpc3Bh
dGNoX3Rlc3Qodm9pZCkKIHsKIAlpbnQgcjsKIAlzdHJ1Y3QgZHJtX2FtZGdwdV9pbmZvX2h3X2lw
IGluZm87CkBAIC0yNDYzLDYgKzI0NjYsMTMgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2Rpc3BhdGNo
X3Rlc3Qodm9pZCkKIAkJYW1kZ3B1X21lbXNldF9kaXNwYXRjaF90ZXN0KGRldmljZV9oYW5kbGUs
IEFNREdQVV9IV19JUF9DT01QVVRFLCByaW5nX2lkKTsKIAkJYW1kZ3B1X21lbWNweV9kaXNwYXRj
aF90ZXN0KGRldmljZV9oYW5kbGUsIEFNREdQVV9IV19JUF9DT01QVVRFLCByaW5nX2lkKTsKIAl9
Cit9CisKK3N0YXRpYyB2b2lkIGFtZGdwdV9nZnhfZGlzcGF0Y2hfdGVzdCh2b2lkKQoreworCWlu
dCByOworCXN0cnVjdCBkcm1fYW1kZ3B1X2luZm9faHdfaXAgaW5mbzsKKwl1aW50MzJfdCByaW5n
X2lkOwogCiAJciA9IGFtZGdwdV9xdWVyeV9od19pcF9pbmZvKGRldmljZV9oYW5kbGUsIEFNREdQ
VV9IV19JUF9HRlgsIDAsICZpbmZvKTsKIAlDVV9BU1NFUlRfRVFVQUwociwgMCk7Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
