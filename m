Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD8ADB50
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 16:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF58089B12;
	Mon,  9 Sep 2019 14:38:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E69889B12
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 14:38:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5oM5sRchpWkVqvTq1qg8Vt4qMeVEfed5lsrfnrWMZ/5rIlEZ2WOCax1qad9vQ4rMIMCRWFIfi/5Ko0mJYdL4KQqkpMJXVJ9xUHlZroeqlO0eUZDbwH6XA8+79/hM5mbeTvdmyUAQgiCwHu4k3rmxGLKT0JGUiubbdeGfCvhDhe8Vy9UzXEx5eMTZdWHxuaG2ced7K+BBFBxXAYcQb9iZ86GvJv513FZhq5572kE3Jv7zZLzwJMM6cv1d4nDBqx0fzY8RhJPPNucPuPYA1Y12mdXRn9E8oeEVfKUNt3U02Xlu47BLAfSbWQuTyIVb1QA36gK0pmbknv8zQ/YxuOrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OikNLN7wNGse42BrQLrccdNh3EKTV6G62wp0qswdXRA=;
 b=a1qljz14aYbOvL754sMpqZmBVLM9oCbR5xwp1hLOjr887zE/sNyHP67wAWEv0WdD4Gftip5crRaXgofTXhOLH6mV174kHvyt3QuJBdz3td/Dbk8sIrPG9iPwpzLNtR8QemiHFqO9nkQw/Lx4TRhtulSJAKh7UrM+sLsp7vJQu3r9Xksioz28C+wVLN4Bn/MhLFPegemFIy3jfoKNhXHkMsn9ztF+0QmrKWPatm5ECPZYcxSzHD0HQ/lejKouUTDiVxlMj/8zraZEkO1PQbFwC1jkCDQGUbtMpaLaZK/QWFeLXpLn5WlKFveX4oeDBO/DYv8BW+FY2h3RNy6kV2ysew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0054.namprd12.prod.outlook.com (2603:10b6:300:103::16)
 by BN8PR12MB3105.namprd12.prod.outlook.com (2603:10b6:408:67::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Mon, 9 Sep
 2019 14:38:29 +0000
Received: from CO1NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0054.outlook.office365.com
 (2603:10b6:300:103::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13 via Frontend
 Transport; Mon, 9 Sep 2019 14:38:29 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT039.mail.protection.outlook.com (10.152.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Mon, 9 Sep 2019 14:38:28 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 9 Sep 2019
 09:38:27 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/2] Enable Dali for DC
Date: Mon, 9 Sep 2019 10:37:58 -0400
Message-ID: <20190909143800.3850-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(199004)(189003)(1076003)(305945005)(486006)(2616005)(53936002)(81156014)(8676002)(53416004)(48376002)(8936002)(126002)(5660300002)(47776003)(4326008)(50466002)(50226002)(478600001)(356004)(6666004)(6916009)(476003)(426003)(316002)(2351001)(2906002)(70586007)(4744005)(336012)(36756003)(186003)(86362001)(51416003)(81166006)(70206006)(26005)(16586007)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3105; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f695a069-a83a-4957-15c8-08d735336162
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN8PR12MB3105; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3105:
X-Microsoft-Antispam-PRVS: <BN8PR12MB31057383F0B41DD40D053F85F9B70@BN8PR12MB3105.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01559F388D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 94KteXt72vGX7mB+isKHH/y3zQZ0sg1r3R6rv0u3LhD8nbz6I1iWu3PKJqHnco8pH65ycoITb5k2oVHRODdFwmCI2e7ZePqju8VzukUycb32WMdXdbEaZ2ylxRaPxXnEHtuzoPcW2OV5dQMmnvFAfW8hDGspZlAoxofUbygV4EvdTU64+t7KEraKmcUegjms3z7Pyu19fgKIk7XpdBTR+KfYP8CZpnDqidurXd+JAk2V2Pm9BAqGWjgA9FCb80R0b63Pt2kKQYLtGrvOXG7P+hTcye1xy5TK9pESIMc62B7oLXi+5KRuMtPH6IoD4eg+JsUJLrEtIulyummD0s0qHk90ywFiQfYZdrynMPalRtJvNtVRpcUPDZTdEZWUwzos1z7IWNL4XQi8hagWuWLiawBjtlRndf0iiEBdNkVIbxM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2019 14:38:28.6514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f695a069-a83a-4957-15c8-08d735336162
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3105
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OikNLN7wNGse42BrQLrccdNh3EKTV6G62wp0qswdXRA=;
 b=iU7op4kWF14IvdGR6adKE2aUQcFhDgbdCznGbbTlwiSMQ/L6evlyJF8RUaBFx7/rABeY1XaY8IKeoUsXsXPiKzwFpdRbPKb8kbwasAagkm73U4qlzieAimOR6XRkO9JNLhm11+vNKhkr3fhd9yGutQYLIqHo4wmBZeC4EeplO5s=
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

RGFsaSBpcyBhIG5ldyBhc2ljIGJhc2VkIG9uIHJhdmVuLiBUaGlzIHBhdGNoIGFkZHMgdGhlIGFz
aWMgSUQgYW5kCnN1cHBvcnQgZm9yIGl0IGluIHRoZSBkaXNwbGF5IGNvcmUuCgpCaGF3YW5wcmVl
dCBMYWtoYSAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgQXNpYyBJRCBmb3IgRGFsaQogIGRy
bS9hbWQvZGlzcGxheTogSW1wbGVtZW50IHZvbHRhZ2UgbGltaXRhdGlvbiBmb3IgZGFsaQoKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25fY2FsY3MuYyAgfCA0ICsrKysK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9pbmNsdWRlL2RhbF9hc2ljX2lkLmggfCA3ICsr
KysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
