Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D9A117E
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 08:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EEA6E02D;
	Thu, 29 Aug 2019 06:06:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502B389FC0;
 Thu, 29 Aug 2019 06:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Achh8SohtSDVEjT+ED4d2EfbhzLYZWiJEFZyRJ/cnczqpNsN2lYB0T3Fwx6OrWvFWyChMNWo524zvmFD5TTzRebn69In0YFfrniIu1cv9ilp//9Cq9FNOtnaHsEQqvQM5rW4mZaa57IMA6Fkvq1RGEbDnHnqOZrE4Lzv8odGUAmT8frBrfKUZysdhIiTzngTPi+K3HzSnlTngVVW2dobmcnmhgHuzIjlwykk/QrKFtHweeCE7FfYQaiXB82npY10l6HmlFUmcOblja+L8vvpLsk4X2HiY/aWvyFTVNqzmajV53+ANzdtL8seK1NJXDo/gWwGb0t6t6O9oKwb6zxqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aByQ3g8rw8uK5GkiDzLLdxItnWnzAPBvty1600CQzyU=;
 b=Xuebz19k4eRgaaSeb4Vm9ctG3msggeAbzk7DzK1OFtQ0SiO5c9AOXsXMGNXtPFtNC81+8mLIEejLwffrGZPxVCnNXsxtk5KKUPPFXzTNgz5dQudszp0POsrvlfgA+uQm0/8zXe4jW8L3THg6FeBo7vP+ttr8/T5mxckiySQCw4Ajp3F8jybU9dHfzpWdhb/6F3dTrCW8+U/Xki8iI08JSxZUxR2Z11tSVpmF9hP3FwpUxW2B6Fhbzwh4YwDctSPaVT0h1mPfcU/AUZDh5bLq/WODYpvlZEAz/bw2sfa2pGSLck19zTQi7MUf/sbF86AzHD8KNZWQe7NsTr9JzySFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=cray.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:610:57::15)
 by BN6PR12MB1267.namprd12.prod.outlook.com (2603:10b6:404:17::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Thu, 29 Aug
 2019 06:05:57 +0000
Received: from CO1NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by CH2PR12CA0005.outlook.office365.com
 (2603:10b6:610:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.18 via Frontend
 Transport; Thu, 29 Aug 2019 06:05:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT045.mail.protection.outlook.com (10.152.81.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 06:05:56 +0000
Received: from kho-5039A.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 01:05:49 -0500
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>,
 <lkaplan@cray.com>, <daniel@ffwll.ch>
Subject: [PATCH RFC v4 11/16] drm,
 cgroup: Add per cgroup bw measure and control
Date: Thu, 29 Aug 2019 02:05:28 -0400
Message-ID: <20190829060533.32315-12-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829060533.32315-1-Kenny.Ho@amd.com>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(428003)(199004)(189003)(5660300002)(86362001)(47776003)(6666004)(356004)(30864003)(1076003)(478600001)(2201001)(2870700001)(2906002)(316002)(70206006)(70586007)(50466002)(110136005)(48376002)(53416004)(426003)(36756003)(4326008)(305945005)(53936002)(8936002)(8676002)(81156014)(186003)(51416003)(2616005)(11346002)(446003)(476003)(76176011)(14444005)(7696005)(126002)(486006)(81166006)(50226002)(336012)(26005)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3ef719f-10be-4e09-4beb-08d72c46f565
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1267842D5B4FF79AAF5AA7A683A20@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1060;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: w9/3OEuu3j/B00+Rm+G2QSoRWoFYqt5/2S3fQxGb+HFNT5sR4FzAMpRoAf1NaqLDGLfOH933huFclguB0iTHWzBVYLFmb6py8IO9X/KUMMaR/1KkmOsvwuPpjLwajaNoRvz+eoDqZiPoFYlgtpnNS0iylTBxHC/lyZDXMgso9xYvBE0Mp8gKSMDNCLeZPzOBiqcx//U3gcVxY/Vcwjqf7Tmu7vqXlPI7im0AN/Tmt3/aPcw61one/EejchIDj/5zG2SXZEdLcMUcWPONeEeUIT/MburChUxxTDmolPAXqrbTKsI1pl7dgpb5yBoCobxCGilvndqhXB2w+jA3x/yoASCpAcefZXtM7n7bnUkF4o53CjP21/6wXCxxBjt5Hzapvh7JfWAXl5L9B4Xft8mWzJ1kl5Zl+yt0pH74wZ24wd0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 06:05:56.9470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ef719f-10be-4e09-4beb-08d72c46f565
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aByQ3g8rw8uK5GkiDzLLdxItnWnzAPBvty1600CQzyU=;
 b=fm0xk+/KMRbUJZ/n2Ei5eVYogoXsm4ra2HIjxbraL1dL0xXnj2RD7U47UcT1DVw8vGnuMgEkDkiHyYMFdwPMyjal/ZmavhMc0mqCe+5vn2qmoK9/+Tc58sThycKA/hrymI8bscMlFpcG89NcpJy03UcIDsQ7qUAHPAjSUkb6kZw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; cray.com; dkim=none (message not signed)
 header.d=none;cray.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGJhbmR3aWR0aCBpcyBtZWFzdXJlZCBieSBrZWVwaW5nIHRyYWNrIG9mIHRoZSBhbW91bnQg
b2YgYnl0ZXMgbW92ZWQKYnkgdHRtIHdpdGhpbiBhIHRpbWUgcGVyaW9kLiAgV2UgZGVmaW5lZCB0
d28gdHlwZSBvZiBiYW5kd2lkdGg6IGJ1cnN0CmFuZCBhdmVyYWdlLiAgQXZlcmFnZSBiYW5kd2lk
dGggaXMgY2FsY3VsYXRlZCBieSBkaXZpZGluZyB0aGUgdG90YWwKYW1vdW50IG9mIGJ5dGVzIG1v
dmVkIHdpdGhpbiBhIGNncm91cCBieSB0aGUgbGlmZXRpbWUgb2YgdGhlIGNncm91cC4KQnVyc3Qg
YmFuZHdpZHRoIGlzIHNpbWlsYXIgZXhjZXB0IHRoYXQgdGhlIGJ5dGUgYW5kIHRpbWUgbWVhc3Vy
ZW1lbnQgaXMKcmVzZXQgYWZ0ZXIgYSB1c2VyIGNvbmZpZ3VyYWJsZSBwZXJpb2QuCgpUaGUgYmFu
ZHdpZHRoIGNvbnRyb2wgaXMgYmVzdCBlZmZvcnQgc2luY2UgaXQgaXMgZG9uZSBvbiBhIHBlciBt
b3ZlCmJhc2lzIGluc3RlYWQgb2YgcGVyIGJ5dGUuICBUaGUgYmFuZHdpZHRoIGlzIGxpbWl0ZWQg
YnkgZGVsYXlpbmcgdGhlCm1vdmUgb2YgYSBidWZmZXIuICBUaGUgYmFuZHdpZHRoIGxpbWl0IGNh
biBiZSBleGNlZWRlZCB3aGVuIHRoZSBuZXh0Cm1vdmUgaXMgbGFyZ2VyIHRoYW4gdGhlIHJlbWFp
bmluZyBhbGxvd2FuY2UuCgpkcm0uYnVyc3RfYndfcGVyaW9kX2luX3VzCiAgICAgICAgQSByZWFk
LXdyaXRlIGZsYXQta2V5ZWQgZmlsZSB3aGljaCBleGlzdHMgb24gdGhlIHJvb3QgY2dyb3VwLgog
ICAgICAgIEVhY2ggZW50cnkgaXMga2V5ZWQgYnkgdGhlIGRybSBkZXZpY2UncyBtYWpvcjptaW5v
ci4KCiAgICAgICAgTGVuZ3RoIG9mIGEgcGVyaW9kIHVzZSB0byBtZWFzdXJlIGJ1cnN0IGJhbmR3
aWR0aCBpbiB1cy4KICAgICAgICBPbmUgcGVyaW9kIHBlciBkZXZpY2UuCgpkcm0uYnVyc3RfYndf
cGVyaW9kX2luX3VzLmRlZmF1bHQKICAgICAgICBBIHJlYWQtb25seSBmbGF0LWtleWVkIGZpbGUg
d2hpY2ggZXhpc3RzIG9uIHRoZSByb290IGNncm91cC4KICAgICAgICBFYWNoIGVudHJ5IGlzIGtl
eWVkIGJ5IHRoZSBkcm0gZGV2aWNlJ3MgbWFqb3I6bWlub3IuCgogICAgICAgIERlZmF1bHQgbGVu
Z3RoIG9mIGEgcGVyaW9kIGluIHVzIChvbmUgcGVyIGRldmljZS4pCgpkcm0uYmFuZHdpZHRoLnN0
YXRzCiAgICAgICAgQSByZWFkLW9ubHkgbmVzdGVkLWtleWVkIGZpbGUgd2hpY2ggZXhpc3RzIG9u
IGFsbCBjZ3JvdXBzLgogICAgICAgIEVhY2ggZW50cnkgaXMga2V5ZWQgYnkgdGhlIGRybSBkZXZp
Y2UncyBtYWpvcjptaW5vci4gIFRoZQogICAgICAgIGZvbGxvd2luZyBuZXN0ZWQga2V5cyBhcmUg
ZGVmaW5lZC4KCiAgICAgICAgICA9PT09PT09PT09PT09PT09PSAgICAgPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0KICAgICAgICAgIGJ1cnN0X2J5dGVfcGVyX3VzICAgICBC
dXJzdCBiYW5kd2lkdGgKICAgICAgICAgIGF2Z19ieXRlc19wZXJfdXMgICAgICBBdmVyYWdlIGJh
bmR3aWR0aAogICAgICAgICAgbW92ZWRfYnl0ZSAgICAgICAgICAgIEFtb3VudCBvZiBieXRlIG1v
dmVkIHdpdGhpbiBhIHBlcmlvZAogICAgICAgICAgYWNjdW1fdXMgICAgICAgICAgICAgIEFtb3Vu
dCBvZiB0aW1lIGFjY3VtdWxhdGVkIGluIGEgcGVyaW9kCiAgICAgICAgICB0b3RhbF9tb3ZlZF9i
eXRlICAgICAgQnl0ZSBtb3ZlZCB3aXRoaW4gdGhlIGNncm91cCBsaWZldGltZQogICAgICAgICAg
dG90YWxfYWNjdW1fdXMgICAgICAgIENncm91cCBsaWZldGltZSBpbiB1cwogICAgICAgICAgYnl0
ZV9jcmVkaXQgICAgICAgICAgIEF2YWlsYWJsZSBieXRlIGNyZWRpdCB0byBsaW1pdCBhdmcgYncK
ICAgICAgICAgID09PT09PT09PT09PT09PT09ICAgICA9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQoKICAgICAgICBSZWFkaW5nIHJldHVybnMgdGhlIGZvbGxvd2luZzo6CiAg
ICAgICAgMjI2OjEgYnVyc3RfYnl0ZV9wZXJfdXM9MjMgYXZnX2J5dGVzX3Blcl91cz0wIG1vdmVk
X2J5dGU9MjI0NDYwOAogICAgICAgIGFjY3VtX3VzPTk1NTc1IHRvdGFsX21vdmVkX2J5dGU9NDU4
OTk3NzYgdG90YWxfYWNjdW1fdXM9MjAxNjM0NTkwCiAgICAgICAgYnl0ZV9jcmVkaXQ9MTMyMTQy
Nzg1OTA0NjQKICAgICAgICAyMjY6MiBidXJzdF9ieXRlX3Blcl91cz0xMCBhdmdfYnl0ZXNfcGVy
X3VzPTIxOSBtb3ZlZF9ieXRlPTQzMDA4MAogICAgICAgIGFjY3VtX3VzPTM5MzUwIHRvdGFsX21v
dmVkX2J5dGU9NjU1MTgwMjY3NTIgdG90YWxfYWNjdW1fdXM9Mjk4MzM3NzIxCiAgICAgICAgYnl0
ZV9jcmVkaXQ9OTIyMzM3MjAzNjg1NDY0NDczNQoKZHJtLmJhbmR3aWR0aC5oaWdoCiAgICAgICAg
QSByZWFkLXdyaXRlIG5lc3RlZC1rZXllZCBmaWxlIHdoaWNoIGV4aXN0cyBvbiBhbGwgY2dyb3Vw
cy4KICAgICAgICBFYWNoIGVudHJ5IGlzIGtleWVkIGJ5IHRoZSBkcm0gZGV2aWNlJ3MgbWFqb3I6
bWlub3IuICBUaGUKICAgICAgICBmb2xsb3dpbmcgbmVzdGVkIGtleXMgYXJlIGRlZmluZWQuCgog
ICAgICAgICAgPT09PT09PT09PT09PT09PSAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CiAgICAgICAgICBieXRlc19pbl9wZXJpb2QgICBCdXJzdCBsaW1pdCBwZXIgcGVy
aW9kIGluIGJ5dGUKICAgICAgICAgIGF2Z19ieXRlc19wZXJfdXMgIEF2ZXJhZ2UgYmFuZHdpZHRo
IGxpbWl0IGluIGJ5dGVzIHBlciB1cwogICAgICAgICAgPT09PT09PT09PT09PT09PSAgPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CgogICAgICAgIFJlYWRpbmcgcmV0dXJu
cyB0aGUgZm9sbG93aW5nOjoKCiAgICAgICAgMjI2OjEgYnl0ZXNfaW5fcGVyaW9kPTkyMjMzNzIw
MzY4NTQ3NzU4MDcgYXZnX2J5dGVzX3Blcl91cz02NTUzNgogICAgICAgIDIyNjoyIGJ5dGVzX2lu
X3BlcmlvZD05MjIzMzcyMDM2ODU0Nzc1ODA3IGF2Z19ieXRlc19wZXJfdXM9NjU1MzYKCmRybS5i
YW5kd2lkdGguZGVmYXVsdAogICAgICAgIEEgcmVhZC1vbmx5IG5lc3RlZC1rZXllZCBmaWxlIHdo
aWNoIGV4aXN0cyBvbiB0aGUgcm9vdCBjZ3JvdXAuCiAgICAgICAgRWFjaCBlbnRyeSBpcyBrZXll
ZCBieSB0aGUgZHJtIGRldmljZSdzIG1ham9yOm1pbm9yLiAgVGhlCiAgICAgICAgZm9sbG93aW5n
IG5lc3RlZCBrZXlzIGFyZSBkZWZpbmVkLgoKICAgICAgICAgID09PT09PT09PT09PT09PT0gID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KICAgICAgICAgIGJ5dGVzX2lu
X3BlcmlvZCAgIERlZmF1bHQgYnVyc3QgbGltaXQgcGVyIHBlcmlvZCBpbiBieXRlCiAgICAgICAg
ICBhdmdfYnl0ZXNfcGVyX3VzICBEZWZhdWx0IGF2ZXJhZ2UgYncgbGltaXQgaW4gYnl0ZXMgcGVy
IHVzCiAgICAgICAgICA9PT09PT09PT09PT09PT09ICA9PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09CgogICAgICAgIFJlYWRpbmcgcmV0dXJucyB0aGUgZm9sbG93aW5nOjoK
CiAgICAgICAgMjI2OjEgYnl0ZXNfaW5fcGVyaW9kPTkyMjMzNzIwMzY4NTQ3NzU4MDcgYXZnX2J5
dGVzX3Blcl91cz02NTUzNgogICAgICAgIDIyNjoyIGJ5dGVzX2luX3BlcmlvZD05MjIzMzcyMDM2
ODU0Nzc1ODA3IGF2Z19ieXRlc19wZXJfdXM9NjU1MzYKCkNoYW5nZS1JZDogSWU1NzM0OTEzMjVj
Y2MxNjUzNWJiOTQzZTc4NTdmNDNiZDA5NjJhZGQKU2lnbmVkLW9mZi1ieTogS2VubnkgSG8gPEtl
bm55LkhvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8ICAgNyAr
CiBpbmNsdWRlL2RybS9kcm1fY2dyb3VwLmggICAgIHwgIDE5ICsrKwogaW5jbHVkZS9saW51eC9j
Z3JvdXBfZHJtLmggICB8ICAxNiArKwoga2VybmVsL2Nncm91cC9kcm0uYyAgICAgICAgICB8IDMx
OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogNCBmaWxlcyBjaGFuZ2VkLCAz
NTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCBh
MGU5Y2U0NmJhZjMuLjMyZWVlODVmMzY0MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCkBAIC0zNiw2ICsz
Niw3IEBACiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fcGxhY2VtZW50Lmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9jZ3JvdXAuaD4KICNpbmNsdWRlIDxsaW51eC9qaWZmaWVzLmg+CisjaW5jbHVkZSA8bGlu
dXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvc2No
ZWQuaD4KICNpbmNsdWRlIDxsaW51eC9tbS5oPgpAQCAtMTI1Niw2ICsxMjU3LDEyIEBAIGludCB0
dG1fYm9fdmFsaWRhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkgKiBDaGVjayB3
aGV0aGVyIHdlIG5lZWQgdG8gbW92ZSBidWZmZXIuCiAJICovCiAJaWYgKCF0dG1fYm9fbWVtX2Nv
bXBhdChwbGFjZW1lbnQsICZiby0+bWVtLCAmbmV3X2ZsYWdzKSkgeworCQl1bnNpZ25lZCBpbnQg
bW92ZV9kZWxheSA9IGRybWNnX2dldF9tZW1fYndfcGVyaW9kX2luX3VzKGJvKTsKKworCQltb3Zl
X2RlbGF5IC89IDIwMDA7IC8qIGNoZWNrIGV2ZXJ5IGhhbGYgcGVyaW9kIGluIG1zKi8KKwkJd2hp
bGUgKGJvLT5iZGV2LT5kZGV2ICE9IE5VTEwgJiYgIWRybWNnX21lbV9jYW5fbW92ZShibykpCisJ
CQltc2xlZXAobW92ZV9kZWxheSk7CisKIAkJcmV0ID0gdHRtX2JvX21vdmVfYnVmZmVyKGJvLCBw
bGFjZW1lbnQsIGN0eCk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX2Nncm91cC5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nncm91cC5oCmluZGV4
IDdkNjNmNzNhNTM3NS4uOWNlMGQ1NGU2YmQ4IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1f
Y2dyb3VwLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nncm91cC5oCkBAIC0xNiw2ICsxNiwxMiBA
QCBzdHJ1Y3QgZHJtY2dfcHJvcHMgewogCiAJczY0CQkJYm9fbGltaXRzX3RvdGFsX2FsbG9jYXRl
ZF9kZWZhdWx0OwogCXM2NAkJCWJvX2xpbWl0c19wZWFrX2FsbG9jYXRlZF9kZWZhdWx0OworCisJ
czY0CQkJbWVtX2J3X2xpbWl0c19wZXJpb2RfaW5fdXM7CisJczY0CQkJbWVtX2J3X2xpbWl0c19w
ZXJpb2RfaW5fdXNfZGVmYXVsdDsKKworCXM2NAkJCW1lbV9id19ieXRlc19pbl9wZXJpb2RfZGVm
YXVsdDsKKwlzNjQJCQltZW1fYndfYXZnX2J5dGVzX3Blcl91c19kZWZhdWx0OwogfTsKIAogI2lm
ZGVmIENPTkZJR19DR1JPVVBfRFJNCkBAIC0zMCw2ICszNiw4IEBAIHZvaWQgZHJtY2dfY2hnX21l
bShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRibyk7CiB2b2lkIGRybWNnX3VuY2hnX21lbShz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRibyk7CiB2b2lkIGRybWNnX21lbV90cmFja19tb3Zl
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqb2xkX2JvLCBib29sIGV2aWN0LAogCQlzdHJ1Y3Qg
dHRtX21lbV9yZWcgKm5ld19tZW0pOwordW5zaWduZWQgaW50IGRybWNnX2dldF9tZW1fYndfcGVy
aW9kX2luX3VzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdGJvKTsKK2Jvb2wgZHJtY2dfbWVt
X2Nhbl9tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdGJvKTsKIAogI2Vsc2UKIHN0YXRp
YyBpbmxpbmUgdm9pZCBkcm1jZ19kZXZpY2VfdXBkYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXZp
Y2UpCkBAIC02Miw1ICs3MCwxNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtY2dfbWVtX3RyYWNr
X21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpvbGRfYm8sCiAJCWJvb2wgZXZpY3QsIHN0
cnVjdCB0dG1fbWVtX3JlZyAqbmV3X21lbSkKIHsKIH0KKworc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBpbnQgZHJtY2dfZ2V0X21lbV9id19wZXJpb2RfaW5fdXMoCisJCXN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqdGJvKQoreworCXJldHVybiAwOworfQorCitzdGF0aWMgaW5saW5lIGJvb2wgZHJt
Y2dfbWVtX2Nhbl9tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqdGJvKQoreworCXJldHVy
biB0cnVlOworfQogI2VuZGlmIC8qIENPTkZJR19DR1JPVVBfRFJNICovCiAjZW5kaWYgLyogX19E
Uk1fQ0dST1VQX0hfXyAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgg
Yi9pbmNsdWRlL2xpbnV4L2Nncm91cF9kcm0uaAppbmRleCA5NTc5ZTJhMGI3MWQuLjI3ODA5YTU4
M2JmMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgKKysrIGIvaW5jbHVk
ZS9saW51eC9jZ3JvdXBfZHJtLmgKQEAgLTE0LDYgKzE0LDE1IEBACiAvKiBsaW1pdCBkZWZpbmVk
IHBlciB0aGUgd2F5IGRybV9taW5vcl9hbGxvYyBvcGVyYXRlcyAqLwogI2RlZmluZSBNQVhfRFJN
X0RFViAoNjQgKiBEUk1fTUlOT1JfUkVOREVSKQogCitlbnVtIGRybWNnX21lbV9id19hdHRyIHsK
KwlEUk1DR19NRU1fQldfQVRUUl9CWVRFX01PVkVELCAvKiBmb3IgY2FsdWxhdGluZyAnaW5zdGFu
dGFuZW91cycgYncgKi8KKwlEUk1DR19NRU1fQldfQVRUUl9BQ0NVTV9VUywgIC8qIGZvciBjYWx1
bGF0aW5nICdpbnN0YW50YW5lb3VzJyBidyAqLworCURSTUNHX01FTV9CV19BVFRSX1RPVEFMX0JZ
VEVfTU9WRUQsCisJRFJNQ0dfTUVNX0JXX0FUVFJfVE9UQUxfQUNDVU1fVVMsCisJRFJNQ0dfTUVN
X0JXX0FUVFJfQllURV9DUkVESVQsCisJX19EUk1DR19NRU1fQldfQVRUUl9MQVNULAorfTsKKwog
ZW51bSBkcm1jZ19yZXNfdHlwZSB7CiAJRFJNQ0dfVFlQRV9CT19UT1RBTCwKIAlEUk1DR19UWVBF
X0JPX1BFQUssCkBAIC0yMSw2ICszMCw4IEBAIGVudW0gZHJtY2dfcmVzX3R5cGUgewogCURSTUNH
X1RZUEVfTUVNLAogCURSTUNHX1RZUEVfTUVNX0VWSUNULAogCURSTUNHX1RZUEVfTUVNX1BFQUss
CisJRFJNQ0dfVFlQRV9CQU5EV0lEVEgsCisJRFJNQ0dfVFlQRV9CQU5EV0lEVEhfUEVSSU9EX0JV
UlNULAogCV9fRFJNQ0dfVFlQRV9MQVNULAogfTsKIApAQCAtNDAsNiArNTEsMTEgQEAgc3RydWN0
IGRybWNnX2RldmljZV9yZXNvdXJjZSB7CiAJczY0CQkJbWVtX3N0YXRzW1RUTV9QTF9QUklWKzFd
OwogCXM2NAkJCW1lbV9wZWFrc1tUVE1fUExfUFJJVisxXTsKIAlzNjQJCQltZW1fc3RhdHNfZXZp
Y3Q7CisKKwlzNjQJCQltZW1fYndfc3RhdHNfbGFzdF91cGRhdGVfdXM7CisJczY0CQkJbWVtX2J3
X3N0YXRzW19fRFJNQ0dfTUVNX0JXX0FUVFJfTEFTVF07CisJczY0CQkJbWVtX2J3X2xpbWl0c19i
eXRlc19pbl9wZXJpb2Q7CisJczY0CQkJbWVtX2J3X2xpbWl0c19hdmdfYnl0ZXNfcGVyX3VzOwog
fTsKIAogLyoqCmRpZmYgLS1naXQgYS9rZXJuZWwvY2dyb3VwL2RybS5jIGIva2VybmVsL2Nncm91
cC9kcm0uYwppbmRleCA4OTlkYzQ0NzIyYzMuLmFiOTYyYTI3N2U1OCAxMDA2NDQKLS0tIGEva2Vy
bmVsL2Nncm91cC9kcm0uYworKysgYi9rZXJuZWwvY2dyb3VwL2RybS5jCkBAIC03LDYgKzcsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+CiAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4K
ICNpbmNsdWRlIDxsaW51eC9jZ3JvdXBfZHJtLmg+CisjaW5jbHVkZSA8bGludXgva3RpbWUuaD4K
ICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KICNp
bmNsdWRlIDxkcm0vZHJtX2Rydi5oPgpAQCAtNDAsNiArNDEsMTcgQEAgc3RhdGljIGNoYXIgY29u
c3QgKnR0bV9wbGFjZW1lbnRfbmFtZXNbXSA9IHsKIAlbVFRNX1BMX1BSSVZdICAgPSAicHJpdiIs
CiB9OwogCitzdGF0aWMgY2hhciBjb25zdCAqbWVtX2J3X2F0dHJfbmFtZXNbXSA9IHsKKwlbRFJN
Q0dfTUVNX0JXX0FUVFJfQllURV9NT1ZFRF0gPSAibW92ZWRfYnl0ZSIsCisJW0RSTUNHX01FTV9C
V19BVFRSX0FDQ1VNX1VTXSA9ICJhY2N1bV91cyIsCisJW0RSTUNHX01FTV9CV19BVFRSX1RPVEFM
X0JZVEVfTU9WRURdID0gInRvdGFsX21vdmVkX2J5dGUiLAorCVtEUk1DR19NRU1fQldfQVRUUl9U
T1RBTF9BQ0NVTV9VU10gPSAidG90YWxfYWNjdW1fdXMiLAorCVtEUk1DR19NRU1fQldfQVRUUl9C
WVRFX0NSRURJVF0gPSAiYnl0ZV9jcmVkaXQiLAorfTsKKworI2RlZmluZSBNRU1fQldfTElNSVRT
X05BTUVfQVZHICJhdmdfYnl0ZXNfcGVyX3VzIgorI2RlZmluZSBNRU1fQldfTElNSVRTX05BTUVf
QlVSU1QgImJ5dGVzX2luX3BlcmlvZCIKKwogc3RhdGljIHN0cnVjdCBkcm1jZyAqcm9vdF9kcm1j
ZyBfX3JlYWRfbW9zdGx5OwogCiBzdGF0aWMgaW50IGRybWNnX2Nzc19mcmVlX2ZuKGludCBpZCwg
dm9pZCAqcHRyLCB2b2lkICpkYXRhKQpAQCAtNzUsNiArODcsOSBAQCBzdGF0aWMgaW5saW5lIGlu
dCBpbml0X2RybWNnX3NpbmdsZShzdHJ1Y3QgZHJtY2cgKmRybWNnLCBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQogCiAJCWlmICghZGRyKQogCQkJcmV0dXJuIC1FTk9NRU07CisKKwkJZGRyLT5tZW1f
Yndfc3RhdHNfbGFzdF91cGRhdGVfdXMgPSBrdGltZV90b191cyhrdGltZV9nZXQoKSk7CisJCWRk
ci0+bWVtX2J3X3N0YXRzW0RSTUNHX01FTV9CV19BVFRSX0FDQ1VNX1VTXSA9IDE7CiAJfQogCiAJ
bXV0ZXhfbG9jaygmZGV2LT5kcm1jZ19tdXRleCk7CkBAIC04Nyw2ICsxMDIsMTIgQEAgc3RhdGlj
IGlubGluZSBpbnQgaW5pdF9kcm1jZ19zaW5nbGUoc3RydWN0IGRybWNnICpkcm1jZywgc3RydWN0
IGRybV9kZXZpY2UgKmRldikKIAlkZHItPmJvX2xpbWl0c19wZWFrX2FsbG9jYXRlZCA9CiAJCWRl
di0+ZHJtY2dfcHJvcHMuYm9fbGltaXRzX3BlYWtfYWxsb2NhdGVkX2RlZmF1bHQ7CiAKKwlkZHIt
Pm1lbV9id19saW1pdHNfYnl0ZXNfaW5fcGVyaW9kID0KKwkJZGV2LT5kcm1jZ19wcm9wcy5tZW1f
YndfYnl0ZXNfaW5fcGVyaW9kX2RlZmF1bHQ7CisKKwlkZHItPm1lbV9id19saW1pdHNfYXZnX2J5
dGVzX3Blcl91cyA9CisJCWRldi0+ZHJtY2dfcHJvcHMubWVtX2J3X2F2Z19ieXRlc19wZXJfdXNf
ZGVmYXVsdDsKKwogCW11dGV4X3VubG9jaygmZGV2LT5kcm1jZ19tdXRleCk7CiAJcmV0dXJuIDA7
CiB9CkBAIC0xMzMsNiArMTU0LDI2IEBAIGRybWNnX2Nzc19hbGxvYyhzdHJ1Y3QgY2dyb3VwX3N1
YnN5c19zdGF0ZSAqcGFyZW50X2NzcykKIAlyZXR1cm4gJmRybWNnLT5jc3M7CiB9CiAKK3N0YXRp
YyBpbmxpbmUgdm9pZCBkcm1jZ19tZW1fYnVyc3RfYndfc3RhdHNfcmVzZXQoc3RydWN0IGRybV9k
ZXZpY2UgKmRldikKK3sKKwlzdHJ1Y3QgY2dyb3VwX3N1YnN5c19zdGF0ZSAqcG9zOworCXN0cnVj
dCBkcm1jZyAqbm9kZTsKKwlzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jlc291cmNlICpkZHI7CisJaW50
IGRldklkeDsKKworCWRldklkeCA9ICBkZXYtPnByaW1hcnktPmluZGV4OworCisJcmN1X3JlYWRf
bG9jaygpOworCWNzc19mb3JfZWFjaF9kZXNjZW5kYW50X3ByZShwb3MsICZyb290X2RybWNnLT5j
c3MpIHsKKwkJbm9kZSA9IGNzc190b19kcm1jZyhwb3MpOworCQlkZHIgPSBub2RlLT5kZXZfcmVz
b3VyY2VzW2RldklkeF07CisKKwkJZGRyLT5tZW1fYndfc3RhdHNbRFJNQ0dfTUVNX0JXX0FUVFJf
QUNDVU1fVVNdID0gMTsKKwkJZGRyLT5tZW1fYndfc3RhdHNbRFJNQ0dfTUVNX0JXX0FUVFJfQllU
RV9NT1ZFRF0gPSAwOworCX0KKwlyY3VfcmVhZF91bmxvY2soKTsKK30KKwogc3RhdGljIHZvaWQg
ZHJtY2dfcHJpbnRfc3RhdHMoc3RydWN0IGRybWNnX2RldmljZV9yZXNvdXJjZSAqZGRyLAogCQlz
dHJ1Y3Qgc2VxX2ZpbGUgKnNmLCBlbnVtIGRybWNnX3Jlc190eXBlIHR5cGUpCiB7CkBAIC0xNjks
NiArMjEwLDMxIEBAIHN0YXRpYyB2b2lkIGRybWNnX3ByaW50X3N0YXRzKHN0cnVjdCBkcm1jZ19k
ZXZpY2VfcmVzb3VyY2UgKmRkciwKIAkJfQogCQlzZXFfcHV0cyhzZiwgIlxuIik7CiAJCWJyZWFr
OworCWNhc2UgRFJNQ0dfVFlQRV9CQU5EV0lEVEg6CisJCWlmIChkZHItPm1lbV9id19zdGF0c1tE
Uk1DR19NRU1fQldfQVRUUl9BQ0NVTV9VU10gPT0gMCkKKwkJCXNlcV9wdXRzKHNmLCAiYnVyc3Rf
Ynl0ZV9wZXJfdXM9TmFOICIpOworCQllbHNlCisJCQlzZXFfcHJpbnRmKHNmLCAiYnVyc3RfYnl0
ZV9wZXJfdXM9JWxsZCAiLAorCQkJCWRkci0+bWVtX2J3X3N0YXRzWworCQkJCURSTUNHX01FTV9C
V19BVFRSX0JZVEVfTU9WRURdLworCQkJCWRkci0+bWVtX2J3X3N0YXRzWworCQkJCURSTUNHX01F
TV9CV19BVFRSX0FDQ1VNX1VTXSk7CisKKwkJaWYgKGRkci0+bWVtX2J3X3N0YXRzW0RSTUNHX01F
TV9CV19BVFRSX1RPVEFMX0FDQ1VNX1VTXSA9PSAwKQorCQkJc2VxX3B1dHMoc2YsICJhdmdfYnl0
ZXNfcGVyX3VzPU5hTiAiKTsKKwkJZWxzZQorCQkJc2VxX3ByaW50ZihzZiwgImF2Z19ieXRlc19w
ZXJfdXM9JWxsZCAiLAorCQkJCWRkci0+bWVtX2J3X3N0YXRzWworCQkJCURSTUNHX01FTV9CV19B
VFRSX1RPVEFMX0JZVEVfTU9WRURdLworCQkJCWRkci0+bWVtX2J3X3N0YXRzWworCQkJCURSTUNH
X01FTV9CV19BVFRSX1RPVEFMX0FDQ1VNX1VTXSk7CisKKwkJZm9yIChpID0gMDsgaSA8IF9fRFJN
Q0dfTUVNX0JXX0FUVFJfTEFTVDsgaSsrKSB7CisJCQlzZXFfcHJpbnRmKHNmLCAiJXM9JWxsZCAi
LCBtZW1fYndfYXR0cl9uYW1lc1tpXSwKKwkJCQkJZGRyLT5tZW1fYndfc3RhdHNbaV0pOworCQl9
CisJCXNlcV9wdXRzKHNmLCAiXG4iKTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJc2VxX3B1dHMo
c2YsICJcbiIpOwogCQlicmVhazsKQEAgLTE3Niw3ICsyNDIsOCBAQCBzdGF0aWMgdm9pZCBkcm1j
Z19wcmludF9zdGF0cyhzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jlc291cmNlICpkZHIsCiB9CiAKIHN0
YXRpYyB2b2lkIGRybWNnX3ByaW50X2xpbWl0cyhzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jlc291cmNl
ICpkZHIsCi0JCXN0cnVjdCBzZXFfZmlsZSAqc2YsIGVudW0gZHJtY2dfcmVzX3R5cGUgdHlwZSkK
KwkJc3RydWN0IHNlcV9maWxlICpzZiwgZW51bSBkcm1jZ19yZXNfdHlwZSB0eXBlLAorCQlzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQogewogCWlmIChkZHIgPT0gTlVMTCkgewogCQlzZXFfcHV0cyhz
ZiwgIlxuIik7CkBAIC0xOTAsNiArMjU3LDE3IEBAIHN0YXRpYyB2b2lkIGRybWNnX3ByaW50X2xp
bWl0cyhzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jlc291cmNlICpkZHIsCiAJY2FzZSBEUk1DR19UWVBF
X0JPX1BFQUs6CiAJCXNlcV9wcmludGYoc2YsICIlbGxkXG4iLCBkZHItPmJvX2xpbWl0c19wZWFr
X2FsbG9jYXRlZCk7CiAJCWJyZWFrOworCWNhc2UgRFJNQ0dfVFlQRV9CQU5EV0lEVEhfUEVSSU9E
X0JVUlNUOgorCQlzZXFfcHJpbnRmKHNmLCAiJWxsZFxuIiwKKwkJCWRldi0+ZHJtY2dfcHJvcHMu
bWVtX2J3X2xpbWl0c19wZXJpb2RfaW5fdXMpOworCQlicmVhazsKKwljYXNlIERSTUNHX1RZUEVf
QkFORFdJRFRIOgorCQlzZXFfcHJpbnRmKHNmLCAiJXM9JWxsZCAlcz0lbGxkXG4iLAorCQkJCU1F
TV9CV19MSU1JVFNfTkFNRV9CVVJTVCwKKwkJCQlkZHItPm1lbV9id19saW1pdHNfYnl0ZXNfaW5f
cGVyaW9kLAorCQkJCU1FTV9CV19MSU1JVFNfTkFNRV9BVkcsCisJCQkJZGRyLT5tZW1fYndfbGlt
aXRzX2F2Z19ieXRlc19wZXJfdXMpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlzZXFfcHV0cyhz
ZiwgIlxuIik7CiAJCWJyZWFrOwpAQCAtMjA4LDYgKzI4NiwxNyBAQCBzdGF0aWMgdm9pZCBkcm1j
Z19wcmludF9kZWZhdWx0KHN0cnVjdCBkcm1jZ19wcm9wcyAqcHJvcHMsCiAJCXNlcV9wcmludGYo
c2YsICIlbGxkXG4iLAogCQkJcHJvcHMtPmJvX2xpbWl0c19wZWFrX2FsbG9jYXRlZF9kZWZhdWx0
KTsKIAkJYnJlYWs7CisJY2FzZSBEUk1DR19UWVBFX0JBTkRXSURUSF9QRVJJT0RfQlVSU1Q6CisJ
CXNlcV9wcmludGYoc2YsICIlbGxkXG4iLAorCQkJcHJvcHMtPm1lbV9id19saW1pdHNfcGVyaW9k
X2luX3VzX2RlZmF1bHQpOworCQlicmVhazsKKwljYXNlIERSTUNHX1RZUEVfQkFORFdJRFRIOgor
CQlzZXFfcHJpbnRmKHNmLCAiJXM9JWxsZCAlcz0lbGxkXG4iLAorCQkJCU1FTV9CV19MSU1JVFNf
TkFNRV9CVVJTVCwKKwkJCQlwcm9wcy0+bWVtX2J3X2J5dGVzX2luX3BlcmlvZF9kZWZhdWx0LAor
CQkJCU1FTV9CV19MSU1JVFNfTkFNRV9BVkcsCisJCQkJcHJvcHMtPm1lbV9id19hdmdfYnl0ZXNf
cGVyX3VzX2RlZmF1bHQpOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlzZXFfcHV0cyhzZiwgIlxu
Iik7CiAJCWJyZWFrOwpAQCAtMjM3LDcgKzMyNiw3IEBAIHN0YXRpYyBpbnQgZHJtY2dfc2VxX3No
b3dfZm4oaW50IGlkLCB2b2lkICpwdHIsIHZvaWQgKmRhdGEpCiAJCWRybWNnX3ByaW50X3N0YXRz
KGRkciwgc2YsIHR5cGUpOwogCQlicmVhazsKIAljYXNlIERSTUNHX0ZUWVBFX0xJTUlUOgotCQlk
cm1jZ19wcmludF9saW1pdHMoZGRyLCBzZiwgdHlwZSk7CisJCWRybWNnX3ByaW50X2xpbWl0cyhk
ZHIsIHNmLCB0eXBlLCBtaW5vci0+ZGV2KTsKIAkJYnJlYWs7CiAJY2FzZSBEUk1DR19GVFlQRV9E
RUZBVUxUOgogCQlkcm1jZ19wcmludF9kZWZhdWx0KCZtaW5vci0+ZGV2LT5kcm1jZ19wcm9wcywg
c2YsIHR5cGUpOwpAQCAtMzAxLDYgKzM5MCw4MyBAQCBzdGF0aWMgdm9pZCBkcm1jZ192YWx1ZV9h
cHBseShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzNjQgKmRzdCwgczY0IHZhbCkKIAltdXRleF91
bmxvY2soJmRldi0+ZHJtY2dfbXV0ZXgpOwogfQogCitzdGF0aWMgdm9pZCBkcm1jZ19uZXN0ZWRf
bGltaXRfcGFyc2Uoc3RydWN0IGtlcm5mc19vcGVuX2ZpbGUgKm9mLAorCQlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBjaGFyICphdHRycykKK3sKKwllbnVtIGRybWNnX3Jlc190eXBlIHR5cGUgPQor
CQlEUk1DR19DVEZfUFJJVjJSRVNUWVBFKG9mX2NmdChvZiktPnByaXZhdGUpOworCXN0cnVjdCBk
cm1jZyAqZHJtY2cgPSBjc3NfdG9fZHJtY2cob2ZfY3NzKG9mKSk7CisJc3RydWN0IGRybWNnICpw
YXJlbnQgPSBkcm1jZ19wYXJlbnQoZHJtY2cpOworCXN0cnVjdCBkcm1jZ19wcm9wcyAqcHJvcHMg
PSAmZGV2LT5kcm1jZ19wcm9wczsKKwljaGFyICpjZnRfbmFtZSA9IG9mX2NmdChvZiktPm5hbWU7
CisJaW50IG1pbm9yID0gZGV2LT5wcmltYXJ5LT5pbmRleDsKKwljaGFyICpuZXN0ZWQgPSBzdHJz
dHJpcChhdHRycyk7CisJc3RydWN0IGRybWNnX2RldmljZV9yZXNvdXJjZSAqZGRyID0KKwkJZHJt
Y2ctPmRldl9yZXNvdXJjZXNbbWlub3JdOworCWNoYXIgKmF0dHI7CisJY2hhciBzbmFtZVsyNTZd
OworCWNoYXIgc3ZhbFsyNTZdOworCXM2NCB2YWw7CisJczY0IHBfbWF4OworCWludCByYzsKKwor
CXdoaWxlIChuZXN0ZWQgIT0gTlVMTCkgeworCQlhdHRyID0gc3Ryc2VwKCZuZXN0ZWQsICIgIik7
CisKKwkJaWYgKHNzY2FuZihhdHRyLCAiJTI1NVtePV09JTI1NVtePV0iLCBzbmFtZSwgc3ZhbCkg
IT0gMikKKwkJCWNvbnRpbnVlOworCisJCXN3aXRjaCAodHlwZSkgeworCQljYXNlIERSTUNHX1RZ
UEVfQkFORFdJRFRIOgorCQkJaWYgKHN0cm5jbXAoc25hbWUsIE1FTV9CV19MSU1JVFNfTkFNRV9C
VVJTVCwgMjU2KQorCQkJCQk9PSAwKSB7CisJCQkJcF9tYXggPSBwYXJlbnQgPT0gTlVMTCA/IFM2
NF9NQVggOgorCQkJCQlwYXJlbnQtPmRldl9yZXNvdXJjZXNbbWlub3JdLT4KKwkJCQkJbWVtX2J3
X2xpbWl0c19ieXRlc19pbl9wZXJpb2Q7CisKKwkJCQlyYyA9IGRybWNnX3Byb2Nlc3NfbGltaXRf
czY0X3ZhbChzdmFsLCB0cnVlLAorCQkJCQlwcm9wcy0+bWVtX2J3X2J5dGVzX2luX3BlcmlvZF9k
ZWZhdWx0LAorCQkJCQlwX21heCwgJnZhbCk7CisKKwkJCQlpZiAocmMgfHwgdmFsIDwgMCkgewor
CQkJCQlkcm1jZ19wcl9jZnRfZXJyKGRybWNnLCByYywgY2Z0X25hbWUsCisJCQkJCQkJbWlub3Ip
OworCQkJCQljb250aW51ZTsKKwkJCQl9CisKKwkJCQlkcm1jZ192YWx1ZV9hcHBseShkZXYsCisJ
CQkJCSZkZHItPm1lbV9id19saW1pdHNfYnl0ZXNfaW5fcGVyaW9kLAorCQkJCQl2YWwpOworCQkJ
CWNvbnRpbnVlOworCQkJfQorCisJCQlpZiAoc3RybmNtcChzbmFtZSwgTUVNX0JXX0xJTUlUU19O
QU1FX0FWRywgMjU2KSA9PSAwKSB7CisJCQkJcF9tYXggPSBwYXJlbnQgPT0gTlVMTCA/IFM2NF9N
QVggOgorCQkJCQlwYXJlbnQtPmRldl9yZXNvdXJjZXNbbWlub3JdLT4KKwkJCQkJbWVtX2J3X2xp
bWl0c19hdmdfYnl0ZXNfcGVyX3VzOworCisJCQkJcmMgPSBkcm1jZ19wcm9jZXNzX2xpbWl0X3M2
NF92YWwoc3ZhbCwgdHJ1ZSwKKwkJCQkJcHJvcHMtPm1lbV9id19hdmdfYnl0ZXNfcGVyX3VzX2Rl
ZmF1bHQsCisJCQkJCXBfbWF4LCAmdmFsKTsKKworCQkJCWlmIChyYyB8fCB2YWwgPCAwKSB7CisJ
CQkJCWRybWNnX3ByX2NmdF9lcnIoZHJtY2csIHJjLCBjZnRfbmFtZSwKKwkJCQkJCQltaW5vcik7
CisJCQkJCWNvbnRpbnVlOworCQkJCX0KKworCQkJCWRybWNnX3ZhbHVlX2FwcGx5KGRldiwKKwkJ
CQkJJmRkci0+bWVtX2J3X2xpbWl0c19hdmdfYnl0ZXNfcGVyX3VzLAorCQkJCQl2YWwpOworCQkJ
CWNvbnRpbnVlOworCQkJfQorCQkJYnJlYWs7IC8qIERSTUNHX1RZUEVfQkFORFdJRFRIICovCisJ
CWRlZmF1bHQ6CisJCQlicmVhazsKKwkJfSAvKiBzd2l0Y2ggKHR5cGUpICovCisJfQorfQorCiBz
dGF0aWMgc3NpemVfdCBkcm1jZ19saW1pdF93cml0ZShzdHJ1Y3Qga2VybmZzX29wZW5fZmlsZSAq
b2YsIGNoYXIgKmJ1ZiwKIAkJc2l6ZV90IG5ieXRlcywgbG9mZl90IG9mZikKIHsKQEAgLTM4Miw2
ICs1NDgsMjUgQEAgc3RhdGljIHNzaXplX3QgZHJtY2dfbGltaXRfd3JpdGUoc3RydWN0IGtlcm5m
c19vcGVuX2ZpbGUgKm9mLCBjaGFyICpidWYsCiAJCQlkcm1jZ192YWx1ZV9hcHBseShkbS0+ZGV2
LAogCQkJCQkmZGRyLT5ib19saW1pdHNfcGVha19hbGxvY2F0ZWQsIHZhbCk7CiAJCQlicmVhazsK
KwkJY2FzZSBEUk1DR19UWVBFX0JBTkRXSURUSF9QRVJJT0RfQlVSU1Q6CisJCQlyYyA9IGRybWNn
X3Byb2Nlc3NfbGltaXRfczY0X3ZhbChzYXR0ciwgZmFsc2UsCisJCQkJcHJvcHMtPm1lbV9id19s
aW1pdHNfcGVyaW9kX2luX3VzX2RlZmF1bHQsCisJCQkJUzY0X01BWCwKKwkJCQkmdmFsKTsKKwor
CQkJaWYgKHJjIHx8IHZhbCA8IDIwMDApIHsKKwkJCQlkcm1jZ19wcl9jZnRfZXJyKGRybWNnLCBy
YywgY2Z0X25hbWUsIG1pbm9yKTsKKwkJCQlicmVhazsKKwkJCX0KKworCQkJZHJtY2dfdmFsdWVf
YXBwbHkoZG0tPmRldiwKKwkJCQkJJnByb3BzLT5tZW1fYndfbGltaXRzX3BlcmlvZF9pbl91cywK
KwkJCQkJdmFsKTsKKwkJCWRybWNnX21lbV9idXJzdF9id19zdGF0c19yZXNldChkbS0+ZGV2KTsK
KwkJCWJyZWFrOworCQljYXNlIERSTUNHX1RZUEVfQkFORFdJRFRIOgorCQkJZHJtY2dfbmVzdGVk
X2xpbWl0X3BhcnNlKG9mLCBkbS0+ZGV2LCBzYXR0cik7CisJCQlicmVhazsKIAkJZGVmYXVsdDoK
IAkJCWJyZWFrOwogCQl9CkBAIC00NTYsNiArNjQxLDQxIEBAIHN0cnVjdCBjZnR5cGUgZmlsZXNb
XSA9IHsKIAkJLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1DR19UWVBFX01FTV9QRUFLLAog
CQkJCQkJRFJNQ0dfRlRZUEVfU1RBVFMpLAogCX0sCisJeworCQkubmFtZSA9ICJidXJzdF9id19w
ZXJpb2RfaW5fdXMiLAorCQkud3JpdGUgPSBkcm1jZ19saW1pdF93cml0ZSwKKwkJLnNlcV9zaG93
ID0gZHJtY2dfc2VxX3Nob3csCisJCS5mbGFncyA9IENGVFlQRV9PTkxZX09OX1JPT1QsCisJCS5w
cml2YXRlID0gRFJNQ0dfQ1RGX1BSSVYoRFJNQ0dfVFlQRV9CQU5EV0lEVEhfUEVSSU9EX0JVUlNU
LAorCQkJCQkJRFJNQ0dfRlRZUEVfTElNSVQpLAorCX0sCisJeworCQkubmFtZSA9ICJidXJzdF9i
d19wZXJpb2RfaW5fdXMuZGVmYXVsdCIsCisJCS5zZXFfc2hvdyA9IGRybWNnX3NlcV9zaG93LAor
CQkuZmxhZ3MgPSBDRlRZUEVfT05MWV9PTl9ST09ULAorCQkucHJpdmF0ZSA9IERSTUNHX0NURl9Q
UklWKERSTUNHX1RZUEVfQkFORFdJRFRIX1BFUklPRF9CVVJTVCwKKwkJCQkJCURSTUNHX0ZUWVBF
X0RFRkFVTFQpLAorCX0sCisJeworCQkubmFtZSA9ICJiYW5kd2lkdGguc3RhdHMiLAorCQkuc2Vx
X3Nob3cgPSBkcm1jZ19zZXFfc2hvdywKKwkJLnByaXZhdGUgPSBEUk1DR19DVEZfUFJJVihEUk1D
R19UWVBFX0JBTkRXSURUSCwKKwkJCQkJCURSTUNHX0ZUWVBFX1NUQVRTKSwKKwl9LAorCXsKKwkJ
Lm5hbWUgPSAiYmFuZHdpZHRoLmhpZ2giLAorCQkud3JpdGUgPSBkcm1jZ19saW1pdF93cml0ZSwK
KwkJLnNlcV9zaG93ID0gZHJtY2dfc2VxX3Nob3csCisJCS5wcml2YXRlID0gRFJNQ0dfQ1RGX1BS
SVYoRFJNQ0dfVFlQRV9CQU5EV0lEVEgsCisJCQkJCQlEUk1DR19GVFlQRV9MSU1JVCksCisJfSwK
Kwl7CisJCS5uYW1lID0gImJhbmR3aWR0aC5kZWZhdWx0IiwKKwkJLnNlcV9zaG93ID0gZHJtY2df
c2VxX3Nob3csCisJCS5mbGFncyA9IENGVFlQRV9PTkxZX09OX1JPT1QsCisJCS5wcml2YXRlID0g
RFJNQ0dfQ1RGX1BSSVYoRFJNQ0dfVFlQRV9CQU5EV0lEVEgsCisJCQkJCQlEUk1DR19GVFlQRV9E
RUZBVUxUKSwKKwl9LAogCXsgfQkvKiB0ZXJtaW5hdGUgKi8KIH07CiAKQEAgLTUxNSw2ICs3MzUs
MTAgQEAgdm9pZCBkcm1jZ19kZXZpY2VfZWFybHlfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQogCiAJZGV2LT5kcm1jZ19wcm9wcy5ib19saW1pdHNfdG90YWxfYWxsb2NhdGVkX2RlZmF1bHQg
PSBTNjRfTUFYOwogCWRldi0+ZHJtY2dfcHJvcHMuYm9fbGltaXRzX3BlYWtfYWxsb2NhdGVkX2Rl
ZmF1bHQgPSBTNjRfTUFYOworCWRldi0+ZHJtY2dfcHJvcHMubWVtX2J3X2xpbWl0c19wZXJpb2Rf
aW5fdXNfZGVmYXVsdCA9IDIwMDAwMDsKKwlkZXYtPmRybWNnX3Byb3BzLm1lbV9id19saW1pdHNf
cGVyaW9kX2luX3VzID0gMjAwMDAwOworCWRldi0+ZHJtY2dfcHJvcHMubWVtX2J3X2J5dGVzX2lu
X3BlcmlvZF9kZWZhdWx0ID0gUzY0X01BWDsKKwlkZXYtPmRybWNnX3Byb3BzLm1lbV9id19hdmdf
Ynl0ZXNfcGVyX3VzX2RlZmF1bHQgPSA2NTUzNjsKIAogCWRybWNnX3VwZGF0ZV9jZ190cmVlKGRl
dik7CiB9CkBAIC02NjAsNiArODg0LDI3IEBAIHZvaWQgZHJtY2dfdW5jaGdfbWVtKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqdGJvKQogfQogRVhQT1JUX1NZTUJPTChkcm1jZ191bmNoZ19tZW0p
OwogCitzdGF0aWMgaW5saW5lIHZvaWQgZHJtY2dfbWVtX2J3X2FjY3VtKHM2NCB0aW1lX3VzLAor
CQlzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jlc291cmNlICpkZHIpCit7CisJczY0IGluY3JlbWVudF91
cyA9IHRpbWVfdXMgLSBkZHItPm1lbV9id19zdGF0c19sYXN0X3VwZGF0ZV91czsKKwlzNjQgbmV3
X2NyZWRpdCA9IGRkci0+bWVtX2J3X2xpbWl0c19hdmdfYnl0ZXNfcGVyX3VzICogaW5jcmVtZW50
X3VzOworCisJZGRyLT5tZW1fYndfc3RhdHNbRFJNQ0dfTUVNX0JXX0FUVFJfQUNDVU1fVVNdCisJ
CSs9IGluY3JlbWVudF91czsKKwlkZHItPm1lbV9id19zdGF0c1tEUk1DR19NRU1fQldfQVRUUl9U
T1RBTF9BQ0NVTV9VU10KKwkJKz0gaW5jcmVtZW50X3VzOworCisJaWYgKChTNjRfTUFYIC0gbmV3
X2NyZWRpdCkgPgorCQkJZGRyLT5tZW1fYndfc3RhdHNbRFJNQ0dfTUVNX0JXX0FUVFJfQllURV9D
UkVESVRdKQorCQlkZHItPm1lbV9id19zdGF0c1tEUk1DR19NRU1fQldfQVRUUl9CWVRFX0NSRURJ
VF0KKwkJCSs9IG5ld19jcmVkaXQ7CisJZWxzZQorCQlkZHItPm1lbV9id19zdGF0c1tEUk1DR19N
RU1fQldfQVRUUl9CWVRFX0NSRURJVF0gPSBTNjRfTUFYOworCisJZGRyLT5tZW1fYndfc3RhdHNf
bGFzdF91cGRhdGVfdXMgPSB0aW1lX3VzOworfQorCiB2b2lkIGRybWNnX21lbV90cmFja19tb3Zl
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqb2xkX2JvLCBib29sIGV2aWN0LAogCQlzdHJ1Y3Qg
dHRtX21lbV9yZWcgKm5ld19tZW0pCiB7CkBAIC02NjksNiArOTE0LDcgQEAgdm9pZCBkcm1jZ19t
ZW1fdHJhY2tfbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKm9sZF9ibywgYm9vbCBldmlj
dCwKIAlpbnQgZGV2SWR4ID0gZGV2LT5wcmltYXJ5LT5pbmRleDsKIAlpbnQgb2xkX21lbV90eXBl
ID0gb2xkX2JvLT5tZW0ubWVtX3R5cGU7CiAJaW50IG5ld19tZW1fdHlwZSA9IG5ld19tZW0tPm1l
bV90eXBlOworCXM2NCB0aW1lX3VzOwogCXN0cnVjdCBkcm1jZ19kZXZpY2VfcmVzb3VyY2UgKmRk
cjsKIAogCWlmIChkcm1jZyA9PSBOVUxMKQpAQCAtNjc3LDYgKzkyMywxNCBAQCB2b2lkIGRybWNn
X21lbV90cmFja19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqb2xkX2JvLCBib29sIGV2
aWN0LAogCW9sZF9tZW1fdHlwZSA9IG9sZF9tZW1fdHlwZSA+IFRUTV9QTF9QUklWID8gVFRNX1BM
X1BSSVYgOiBvbGRfbWVtX3R5cGU7CiAJbmV3X21lbV90eXBlID0gbmV3X21lbV90eXBlID4gVFRN
X1BMX1BSSVYgPyBUVE1fUExfUFJJViA6IG5ld19tZW1fdHlwZTsKIAorCWlmIChyb290X2RybWNn
LT5kZXZfcmVzb3VyY2VzW2RldklkeF0gIT0gTlVMTCAmJgorCQkJcm9vdF9kcm1jZy0+ZGV2X3Jl
c291cmNlc1tkZXZJZHhdLT4KKwkJCW1lbV9id19zdGF0c1tEUk1DR19NRU1fQldfQVRUUl9BQ0NV
TV9VU10gPj0KKwkJCWRldi0+ZHJtY2dfcHJvcHMubWVtX2J3X2xpbWl0c19wZXJpb2RfaW5fdXMp
CisJCWRybWNnX21lbV9idXJzdF9id19zdGF0c19yZXNldChkZXYpOworCisJdGltZV91cyA9IGt0
aW1lX3RvX3VzKGt0aW1lX2dldCgpKTsKKwogCW11dGV4X2xvY2soJmRldi0+ZHJtY2dfbXV0ZXgp
OwogCWZvciAoIDsgZHJtY2cgIT0gTlVMTDsgZHJtY2cgPSBkcm1jZ19wYXJlbnQoZHJtY2cpKSB7
CiAJCWRkciA9IGRybWNnLT5kZXZfcmVzb3VyY2VzW2RldklkeF07CkBAIC02ODksNyArOTQzLDY4
IEBAIHZvaWQgZHJtY2dfbWVtX3RyYWNrX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpv
bGRfYm8sIGJvb2wgZXZpY3QsCiAKIAkJaWYgKGV2aWN0KQogCQkJZGRyLT5tZW1fc3RhdHNfZXZp
Y3QrKzsKKworCQlkcm1jZ19tZW1fYndfYWNjdW0odGltZV91cywgZGRyKTsKKworCQlkZHItPm1l
bV9id19zdGF0c1tEUk1DR19NRU1fQldfQVRUUl9CWVRFX01PVkVEXQorCQkJKz0gbW92ZV9pbl9i
eXRlczsKKwkJZGRyLT5tZW1fYndfc3RhdHNbRFJNQ0dfTUVNX0JXX0FUVFJfVE9UQUxfQllURV9N
T1ZFRF0KKwkJCSs9IG1vdmVfaW5fYnl0ZXM7CisKKwkJZGRyLT5tZW1fYndfc3RhdHNbRFJNQ0df
TUVNX0JXX0FUVFJfQllURV9DUkVESVRdCisJCQktPSBtb3ZlX2luX2J5dGVzOwogCX0KIAltdXRl
eF91bmxvY2soJmRldi0+ZHJtY2dfbXV0ZXgpOwogfQogRVhQT1JUX1NZTUJPTChkcm1jZ19tZW1f
dHJhY2tfbW92ZSk7CisKK3Vuc2lnbmVkIGludCBkcm1jZ19nZXRfbWVtX2J3X3BlcmlvZF9pbl91
cyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRibykKK3sKKwlzdHJ1Y3QgZHJtY2dfcHJvcHMg
KnByb3BzOworCisJLy9UT0RPIHJlcGxhY2Ugd2l0aCBCVUdfT04KKwlpZiAodGJvLT5iZGV2LT5k
ZGV2ID09IE5VTEwpCisJCXJldHVybiAwOworCisJcHJvcHMgPSAmdGJvLT5iZGV2LT5kZGV2LT5k
cm1jZ19wcm9wczsKKworCXJldHVybiAodW5zaWduZWQgaW50KSBwcm9wcy0+bWVtX2J3X2xpbWl0
c19wZXJpb2RfaW5fdXM7Cit9CitFWFBPUlRfU1lNQk9MKGRybWNnX2dldF9tZW1fYndfcGVyaW9k
X2luX3VzKTsKKworYm9vbCBkcm1jZ19tZW1fY2FuX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICp0Ym8pCit7CisJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHRiby0+YmRldi0+ZGRldjsK
KwlzdHJ1Y3QgZHJtY2cgKmRybWNnID0gdGJvLT5kcm1jZzsKKwlpbnQgZGV2SWR4ID0gZGV2LT5w
cmltYXJ5LT5pbmRleDsKKwlzNjQgdGltZV91czsKKwlzdHJ1Y3QgZHJtY2dfZGV2aWNlX3Jlc291
cmNlICpkZHI7CisJYm9vbCByZXN1bHQgPSB0cnVlOworCisJaWYgKHJvb3RfZHJtY2ctPmRldl9y
ZXNvdXJjZXNbZGV2SWR4XSAhPSBOVUxMICYmCisJCQlyb290X2RybWNnLT5kZXZfcmVzb3VyY2Vz
W2RldklkeF0tPgorCQkJbWVtX2J3X3N0YXRzW0RSTUNHX01FTV9CV19BVFRSX0FDQ1VNX1VTXSA+
PQorCQkJZGV2LT5kcm1jZ19wcm9wcy5tZW1fYndfbGltaXRzX3BlcmlvZF9pbl91cykKKwkJZHJt
Y2dfbWVtX2J1cnN0X2J3X3N0YXRzX3Jlc2V0KGRldik7CisKKwl0aW1lX3VzID0ga3RpbWVfdG9f
dXMoa3RpbWVfZ2V0KCkpOworCisJbXV0ZXhfbG9jaygmZGV2LT5kcm1jZ19tdXRleCk7CisJZm9y
ICggOyBkcm1jZyAhPSBOVUxMOyBkcm1jZyA9IGRybWNnX3BhcmVudChkcm1jZykpIHsKKwkJZGRy
ID0gZHJtY2ctPmRldl9yZXNvdXJjZXNbZGV2SWR4XTsKKworCQlkcm1jZ19tZW1fYndfYWNjdW0o
dGltZV91cywgZGRyKTsKKworCQlpZiAocmVzdWx0ICYmCisJCQkoZGRyLT5tZW1fYndfc3RhdHNb
RFJNQ0dfTUVNX0JXX0FUVFJfQllURV9NT1ZFRF0KKwkJCSA+PSBkZHItPm1lbV9id19saW1pdHNf
Ynl0ZXNfaW5fcGVyaW9kIHx8CisJCQlkZHItPm1lbV9id19zdGF0c1tEUk1DR19NRU1fQldfQVRU
Ul9CWVRFX0NSRURJVF0KKwkJCSA8PSAwKSkgeworCQkJcmVzdWx0ID0gZmFsc2U7CisJCX0KKwl9
CisJbXV0ZXhfdW5sb2NrKCZkZXYtPmRybWNnX211dGV4KTsKKworCXJldHVybiByZXN1bHQ7Cit9
CitFWFBPUlRfU1lNQk9MKGRybWNnX21lbV9jYW5fbW92ZSk7Ci0tIAoyLjIyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
