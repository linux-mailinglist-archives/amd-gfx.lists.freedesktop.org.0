Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A63D07E3
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Jul 2021 06:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5CB6E89F;
	Wed, 21 Jul 2021 04:48:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C686E89F
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Jul 2021 04:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cpo41hlHo32ibL7N8yMLVYed3jb2eBw3HQEYwfGy6Gmfpmzrq25xNOzleHNG3EsSPkAgrxcgZBqQnnS0ATGwSHyUOc03L3G2xfi8P6m8bBGxxjH32Es9lPHJo6bpTyv73hLHIqVfLOy2SHXkbITOFwNuSiMqcO7UvoUC1BCTqklG5D4pXE66LSdfvuAb2ndflacJnnDAiW+tC4Z74JIvEuGV7W+ePgDi2+3RAFwZ4upG2W+nYMhaeve5fy5uZMa0TZyLEviluBmx9CW4Ks7XGqRsYEKjRXx2xxxyi28jrV0LaglcTkqiEWARez+7U7rPW8DQQd0XeBfHxVyi2jY3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDYMuEOkRMCbS0Kwi63GoYxbQcOhBQD9nwNHuwmDO/w=;
 b=jMusaOQtxIX1+OXpG/emS6sKWL8QECIdRWU+q0/GJX84+cWtyb9svLgZs2NBLGEovYf3I1N4ATqkQiknSJeu1g36rHbAdv5Ka42OgVGC8MRG7QaeoGHFgiaf58hLT7E6cLHfQcgWAhgtTm7VvzEWy9gh1PL8kjeq4/UBTCzWDM5hTGs624X99XNk3ictYc2DO2nOV44nhcUhxy+eqVN4JDn/5Cchq0pQqWjDaX+7/K41tAKxmiQw7jv7d+kiw6+PXknbtYhc05xeMSMmxbLyYdeg/8p7pvm6BTzMgKCe8Mue5qGlqB0fxMKYwQdIAHA7YiUhFuNv8g9Aeur9yO4NvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ellerman.id.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDYMuEOkRMCbS0Kwi63GoYxbQcOhBQD9nwNHuwmDO/w=;
 b=rAdBfNPbOJ49CoBJN+QJS2WLc8KEMyga+VQOiEUCcw8EivxD9DN1vsh1no/MfDNs4YeGP0wySanGCbRMZ07Y6bbA4D3+raiNmbofa/BjK5im7hy3imKHqHbXyuSJQSeYuLeMCQL6sb9C+N2D3i3axuG7B0tEjLRn8Ym1Nrk9BRY=
Received: from BN0PR04CA0184.namprd04.prod.outlook.com (2603:10b6:408:e9::9)
 by DM6PR12MB3468.namprd12.prod.outlook.com (2603:10b6:5:38::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 04:48:12 +0000
Received: from BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::3a) by BN0PR04CA0184.outlook.office365.com
 (2603:10b6:408:e9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 21 Jul 2021 04:48:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; ellerman.id.au; dkim=none (message not signed)
 header.d=none;ellerman.id.au; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT015.mail.protection.outlook.com (10.13.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 04:48:11 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 23:48:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 21:48:11 -0700
Received: from Bumblebee.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 23:48:04 -0500
From: Anson Jacob <Anson.Jacob@amd.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <christophe.leroy@csgroup.eu>, <linuxppc-dev@lists.ozlabs.org>,
 <amd-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC v2 1/2] ppc/fpu: Add generic FPU api similar to x86
Date: Wed, 21 Jul 2021 00:48:00 -0400
Message-ID: <20210721044801.840501-2-Anson.Jacob@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721044801.840501-1-Anson.Jacob@amd.com>
References: <20210721044801.840501-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56535b63-d5bf-4eef-b872-08d94c02be72
X-MS-TrafficTypeDiagnostic: DM6PR12MB3468:
X-Microsoft-Antispam-PRVS: <DM6PR12MB346827EB6D5E44C88D1A48B3EBE39@DM6PR12MB3468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: td441VnmDmItqMmY/qA8P09rwopfdco44lcLGRKy00dfv8WvEnLGpR4/qRp7WZ1ENuhP9JWL4c8aCvVc0ce8fFWag8f7wAYpSTd+yRyzLu7axSOiF2tfRlGA1C8agdJT77gcHKaFbOxj8WvhW6VpTZVkhmo9DT3ZKPnNx0rGWMrQ/Fqknjk8Azt16nZYkkpZ0sp8IYZuIqKT/ifL5tnhuHgFuL15AoMsIwKdz0r1mVsEamVsXwdnunajFpT/NyPOkgys8dFL+iC+og19BgDhqNfHIdCiNkJccHbNY+sZy06qhWBbdwOIYKuqjoGG2LG/1lHSTK0Ra7qnuH9MdweUo9IT4/uzdGKCZl5EiNdrtsb/u04Cn1p5kFLvlSDOLeb2d+wIusWtvJcxleogoVivba0R/cbNxzNpdT61eTqGUj8h6b33+goPAGcQBzukn2C98076EM708WeqSQNpzWs1uQhCzaKOX2nyyNdJlUTGbdn2R2S3xMLybXey7I9OOz1SRz8o5jbnefWPJ3RjgDs5BIoax9Heajzb6v0Vsbk59/u1MYN2T463Fb9oAg9tYbQTKTlPwNHq5K6fW97RVXF7Ooy2OuEJ+d/DfptD2Kfj33ckOgEi79RNGIEDmpTbfUFeJ1eyW2bHYMiARjLw/2bNPRWoeJ9uXcVUbzkGJ+KiF6aj6GWHdmWR6g5S0cIVsiqTR0rPeC1oQCBtzWJQM3Np1bg8mQg5F4S1CSCJdbPrWPaP+/bZqUl30kCiYwt0yX7wHoebWC7+KyHAhiFk9L4Bzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966006)(36840700001)(1076003)(8676002)(186003)(81166007)(2906002)(86362001)(5660300002)(7696005)(478600001)(36860700001)(82310400003)(4326008)(26005)(83380400001)(47076005)(336012)(8936002)(6666004)(54906003)(36756003)(82740400003)(2616005)(356005)(426003)(316002)(110136005)(70586007)(70206006)(41533002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 04:48:11.7951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56535b63-d5bf-4eef-b872-08d94c02be72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3468
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Sunpeng.Li@amd.com, Harry Wentland <harry.wentland@amd.com>,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 Christoph Hellwig <hch@infradead.org>, Anson.Jacob@amd.com,
 Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, bindu.r@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

LSBBZGQga2VybmVsX2ZwdV9iZWdpbiAmIGtlcm5lbF9mcHVfZW5kIEFQSSBhcyB4ODYKLSBBZGQg
bG9naWMgc2ltaWxhciB0byB4ODYgdG8gZW5zdXJlIGZwdQogIGJlZ2luL2VuZCBjYWxsIGNvcnJl
Y3RuZXNzCi0gQWRkIGtlcm5lbF9mcHVfZW5hYmxlZCB0byBrbm93IGlmIEZQVSBpcyBlbmFibGVk
Cgp2MjoKLSBBZGRlZCBhc20vZnB1L2FwaS5oIHBvd2VycGMgdmFyaWFudCB3aXRoIGtlcm5lbF9m
cHVfYmVnaW4vZW5kKCkKICBhbmQga2VybmVsX2ZwdV9lbmFibGVkKCkgZGVjbGFyYXRpb25zCi0g
VXBkYXRlZCBrZXJuZWxfZnB1X2VuYWJsZWQgYXMgRVhQT1JUX1NZTUJPTF9HUEwKClNpZ25lZC1v
ZmYtYnk6IEFuc29uIEphY29iIDxBbnNvbi5KYWNvYkBhbWQuY29tPgpDQzogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPgpDQzogUm9kcmlnbyBTaXF1ZWlyYSA8Um9kcmlnby5T
aXF1ZWlyYUBhbWQuY29tPgpDQzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5j
b20+CkNDOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQog
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ZwdS9hcGkuaCAgIHwgIDE4ICsrKysKIGFyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCB8ICAyNSArLS0tLS0KIGFyY2gvcG93ZXJwYy9r
ZXJuZWwvcHJvY2Vzcy5jICAgICAgICB8IDEzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDMgZmlsZXMgY2hhbmdlZCwgMTUxIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9mcHUvYXBpLmgKCmRpZmYg
LS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZnB1L2FwaS5oIGIvYXJjaC9wb3dlcnBj
L2luY2x1ZGUvYXNtL2ZwdS9hcGkuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwMDAuLjU3MzA4Y2RjNjVjOQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9mcHUvYXBpLmgKQEAgLTAsMCArMSwxOCBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAgKi8KKworI2lmbmRlZiBfQVNNX1BPV0VSUENfRlBVX0FQSV9ICisjZGVm
aW5lIF9BU01fUE9XRVJQQ19GUFVfQVBJX0gKKworLyoKKyAqIFVzZSBrZXJuZWxfZnB1X2JlZ2lu
L2VuZCgpIGlmIHlvdSBpbnRlbmQgdG8gdXNlIEZQVSBpbiBrZXJuZWwgY29udGV4dC4gSXQKKyAq
IGRpc2FibGVzIHByZWVtcHRpb24gc28gYmUgY2FyZWZ1bCBpZiB5b3UgaW50ZW5kIHRvIHVzZSBp
dCBmb3IgbG9uZyBwZXJpb2RzCisgKiBvZiB0aW1lLgorICogVE9ETzogSWYgeW91IGludGVuZCB0
byB1c2UgdGhlIEZQVSBpbiBpcnEvc29mdGlycSB5b3UgbmVlZCB0byBjaGVjayBmaXJzdCB3aXRo
CisgKiBpcnFfZnB1X3VzYWJsZSgpIGlmIGl0IGlzIHBvc3NpYmxlLgorICovCisKK2V4dGVybiBi
b29sIGtlcm5lbF9mcHVfZW5hYmxlZCh2b2lkKTsKK2V4dGVybiB2b2lkIGtlcm5lbF9mcHVfYmVn
aW4odm9pZCk7CitleHRlcm4gdm9pZCBrZXJuZWxfZnB1X2VuZCh2b2lkKTsKKworI2VuZGlmIC8q
IF9BU01fUE9XRVJQQ19GUFVfQVBJX0ggKi8KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9zd2l0Y2hfdG8uaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8u
aAppbmRleCA5ZDFmYmQ4YmUxYzcuLmE5YTkxOTI3OWY0OCAxMDA2NDQKLS0tIGEvYXJjaC9wb3dl
cnBjL2luY2x1ZGUvYXNtL3N3aXRjaF90by5oCisrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9zd2l0Y2hfdG8uaApAQCAtNDEsMTAgKzQxLDcgQEAgZXh0ZXJuIHZvaWQgZW5hYmxlX2tlcm5l
bF9mcCh2b2lkKTsKIGV4dGVybiB2b2lkIGZsdXNoX2ZwX3RvX3RocmVhZChzdHJ1Y3QgdGFza19z
dHJ1Y3QgKik7CiBleHRlcm4gdm9pZCBnaXZldXBfZnB1KHN0cnVjdCB0YXNrX3N0cnVjdCAqKTsK
IGV4dGVybiB2b2lkIHNhdmVfZnB1KHN0cnVjdCB0YXNrX3N0cnVjdCAqKTsKLXN0YXRpYyBpbmxp
bmUgdm9pZCBkaXNhYmxlX2tlcm5lbF9mcCh2b2lkKQotewotCW1zcl9jaGVja19hbmRfY2xlYXIo
TVNSX0ZQKTsKLX0KK2V4dGVybiB2b2lkIGRpc2FibGVfa2VybmVsX2ZwKHZvaWQpOwogI2Vsc2UK
IHN0YXRpYyBpbmxpbmUgdm9pZCBzYXZlX2ZwdShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQpIHsgfQog
c3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2ZwX3RvX3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnQpIHsgfQpAQCAtNTUsMTAgKzUyLDcgQEAgZXh0ZXJuIHZvaWQgZW5hYmxlX2tlcm5lbF9hbHRp
dmVjKHZvaWQpOwogZXh0ZXJuIHZvaWQgZmx1c2hfYWx0aXZlY190b190aHJlYWQoc3RydWN0IHRh
c2tfc3RydWN0ICopOwogZXh0ZXJuIHZvaWQgZ2l2ZXVwX2FsdGl2ZWMoc3RydWN0IHRhc2tfc3Ry
dWN0ICopOwogZXh0ZXJuIHZvaWQgc2F2ZV9hbHRpdmVjKHN0cnVjdCB0YXNrX3N0cnVjdCAqKTsK
LXN0YXRpYyBpbmxpbmUgdm9pZCBkaXNhYmxlX2tlcm5lbF9hbHRpdmVjKHZvaWQpCi17Ci0JbXNy
X2NoZWNrX2FuZF9jbGVhcihNU1JfVkVDKTsKLX0KK2V4dGVybiB2b2lkIGRpc2FibGVfa2VybmVs
X2FsdGl2ZWModm9pZCk7CiAjZWxzZQogc3RhdGljIGlubGluZSB2b2lkIHNhdmVfYWx0aXZlYyhz
dHJ1Y3QgdGFza19zdHJ1Y3QgKnQpIHsgfQogc3RhdGljIGlubGluZSB2b2lkIF9fZ2l2ZXVwX2Fs
dGl2ZWMoc3RydWN0IHRhc2tfc3RydWN0ICp0KSB7IH0KQEAgLTY3LDIwICs2MSw3IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBfX2dpdmV1cF9hbHRpdmVjKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCkgeyB9
CiAjaWZkZWYgQ09ORklHX1ZTWAogZXh0ZXJuIHZvaWQgZW5hYmxlX2tlcm5lbF92c3godm9pZCk7
CiBleHRlcm4gdm9pZCBmbHVzaF92c3hfdG9fdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAqKTsK
LXN0YXRpYyBpbmxpbmUgdm9pZCBkaXNhYmxlX2tlcm5lbF92c3godm9pZCkKLXsKLQltc3JfY2hl
Y2tfYW5kX2NsZWFyKE1TUl9GUHxNU1JfVkVDfE1TUl9WU1gpOwotfQotI2Vsc2UKLXN0YXRpYyBp
bmxpbmUgdm9pZCBlbmFibGVfa2VybmVsX3ZzeCh2b2lkKQotewotCUJVSUxEX0JVRygpOwotfQot
Ci1zdGF0aWMgaW5saW5lIHZvaWQgZGlzYWJsZV9rZXJuZWxfdnN4KHZvaWQpCi17Ci0JQlVJTERf
QlVHKCk7Ci19CitleHRlcm4gdm9pZCBkaXNhYmxlX2tlcm5lbF92c3godm9pZCk7CiAjZW5kaWYK
IAogI2lmZGVmIENPTkZJR19TUEUKZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJv
Y2Vzcy5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNzLmMKaW5kZXggMTg1YmViMjkwNTgw
Li45NjkwOTZjMDEyM2MgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5j
CisrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5jCkBAIC03NSw2ICs3NSwxNyBAQAog
I2RlZmluZSBUTV9ERUJVRyh4Li4uKSBkbyB7IH0gd2hpbGUoMCkKICNlbmRpZgogCisvKgorICog
VHJhY2sgd2hldGhlciB0aGUga2VybmVsIGlzIHVzaW5nIHRoZSBGUFUgc3RhdGUKKyAqIGN1cnJl
bnRseS4KKyAqCisgKiBUaGlzIGZsYWcgaXMgdXNlZDoKKyAqCisgKiAgIC0ga2VybmVsX2ZwdV9i
ZWdpbigpL2VuZCgpIGNvcnJlY3RuZXNzCisgKiAgIC0ga2VybmVsX2ZwdV9lbmFibGVkIGluZm8K
KyAqLworc3RhdGljIERFRklORV9QRVJfQ1BVKGJvb2wsIGluX2tlcm5lbF9mcHUpOworCiBleHRl
cm4gdW5zaWduZWQgbG9uZyBfZ2V0X1NQKHZvaWQpOwogCiAjaWZkZWYgQ09ORklHX1BQQ19UUkFO
U0FDVElPTkFMX01FTQpAQCAtMjEyLDYgKzIyMyw5IEBAIHZvaWQgZW5hYmxlX2tlcm5lbF9mcCh2
b2lkKQogCXVuc2lnbmVkIGxvbmcgY3B1bXNyOwogCiAJV0FSTl9PTihwcmVlbXB0aWJsZSgpKTsK
KwlXQVJOX09OX09OQ0UodGhpc19jcHVfcmVhZChpbl9rZXJuZWxfZnB1KSk7CisKKwl0aGlzX2Nw
dV93cml0ZShpbl9rZXJuZWxfZnB1LCB0cnVlKTsKIAogCWNwdW1zciA9IG1zcl9jaGVja19hbmRf
c2V0KE1TUl9GUCk7CiAKQEAgLTIzMSw2ICsyNDUsMTUgQEAgdm9pZCBlbmFibGVfa2VybmVsX2Zw
KHZvaWQpCiAJfQogfQogRVhQT1JUX1NZTUJPTChlbmFibGVfa2VybmVsX2ZwKTsKKwordm9pZCBk
aXNhYmxlX2tlcm5lbF9mcCh2b2lkKQoreworCVdBUk5fT05fT05DRSghdGhpc19jcHVfcmVhZChp
bl9rZXJuZWxfZnB1KSk7CisKKwl0aGlzX2NwdV93cml0ZShpbl9rZXJuZWxfZnB1LCBmYWxzZSk7
CisJbXNyX2NoZWNrX2FuZF9jbGVhcihNU1JfRlApOworfQorRVhQT1JUX1NZTUJPTChkaXNhYmxl
X2tlcm5lbF9mcCk7CiAjZWxzZQogc3RhdGljIGlubGluZSB2b2lkIF9fZ2l2ZXVwX2ZwdShzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnRzaykgeyB9CiAjZW5kaWYgLyogQ09ORklHX1BQQ19GUFUgKi8KQEAg
LTI2Myw2ICsyODYsOSBAQCB2b2lkIGVuYWJsZV9rZXJuZWxfYWx0aXZlYyh2b2lkKQogCXVuc2ln
bmVkIGxvbmcgY3B1bXNyOwogCiAJV0FSTl9PTihwcmVlbXB0aWJsZSgpKTsKKwlXQVJOX09OX09O
Q0UodGhpc19jcHVfcmVhZChpbl9rZXJuZWxfZnB1KSk7CisKKwl0aGlzX2NwdV93cml0ZShpbl9r
ZXJuZWxfZnB1LCB0cnVlKTsKIAogCWNwdW1zciA9IG1zcl9jaGVja19hbmRfc2V0KE1TUl9WRUMp
OwogCkBAIC0yODMsNiArMzA5LDE0IEBAIHZvaWQgZW5hYmxlX2tlcm5lbF9hbHRpdmVjKHZvaWQp
CiB9CiBFWFBPUlRfU1lNQk9MKGVuYWJsZV9rZXJuZWxfYWx0aXZlYyk7CiAKK3ZvaWQgZGlzYWJs
ZV9rZXJuZWxfYWx0aXZlYyh2b2lkKQoreworCVdBUk5fT05fT05DRSghdGhpc19jcHVfcmVhZChp
bl9rZXJuZWxfZnB1KSk7CisKKwl0aGlzX2NwdV93cml0ZShpbl9rZXJuZWxfZnB1LCBmYWxzZSk7
CisJbXNyX2NoZWNrX2FuZF9jbGVhcihNU1JfVkVDKTsKK30KK0VYUE9SVF9TWU1CT0woZGlzYWJs
ZV9rZXJuZWxfYWx0aXZlYyk7CiAvKgogICogTWFrZSBzdXJlIHRoZSBWTVgvQWx0aXZlYyByZWdp
c3RlciBzdGF0ZSBpbiB0aGUKICAqIHRoZSB0aHJlYWRfc3RydWN0IGlzIHVwIHRvIGRhdGUgZm9y
IHRhc2sgdHNrLgpAQCAtMzMzLDYgKzM2Nyw5IEBAIHZvaWQgZW5hYmxlX2tlcm5lbF92c3godm9p
ZCkKIAl1bnNpZ25lZCBsb25nIGNwdW1zcjsKIAogCVdBUk5fT04ocHJlZW1wdGlibGUoKSk7CisJ
V0FSTl9PTl9PTkNFKHRoaXNfY3B1X3JlYWQoaW5fa2VybmVsX2ZwdSkpOworCisJdGhpc19jcHVf
d3JpdGUoaW5fa2VybmVsX2ZwdSwgdHJ1ZSk7CiAKIAljcHVtc3IgPSBtc3JfY2hlY2tfYW5kX3Nl
dChNU1JfRlB8TVNSX1ZFQ3xNU1JfVlNYKTsKIApAQCAtMzU0LDYgKzM5MSwxNSBAQCB2b2lkIGVu
YWJsZV9rZXJuZWxfdnN4KHZvaWQpCiB9CiBFWFBPUlRfU1lNQk9MKGVuYWJsZV9rZXJuZWxfdnN4
KTsKIAordm9pZCBkaXNhYmxlX2tlcm5lbF92c3godm9pZCkKK3sKKwlXQVJOX09OX09OQ0UoIXRo
aXNfY3B1X3JlYWQoaW5fa2VybmVsX2ZwdSkpOworCisJdGhpc19jcHVfd3JpdGUoaW5fa2VybmVs
X2ZwdSwgZmFsc2UpOworCW1zcl9jaGVja19hbmRfY2xlYXIoTVNSX0ZQfE1TUl9WRUN8TVNSX1ZT
WCk7Cit9CitFWFBPUlRfU1lNQk9MKGRpc2FibGVfa2VybmVsX3ZzeCk7CisKIHZvaWQgZmx1c2hf
dnN4X3RvX3RocmVhZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKIHsKIAlpZiAodHNrLT50aHJl
YWQucmVncykgewpAQCAtNDA2LDYgKzQ1Miw5MCBAQCB2b2lkIGZsdXNoX3NwZV90b190aHJlYWQo
c3RydWN0IHRhc2tfc3RydWN0ICp0c2spCiB9CiAjZW5kaWYgLyogQ09ORklHX1NQRSAqLwogCitz
dGF0aWMgYm9vbCBmcHVfc3VwcG9ydCh2b2lkKQoreworCWlmIChjcHVfaGFzX2ZlYXR1cmUoQ1BV
X0ZUUl9WU1hfQ09NUCkpIHsKKwkJcmV0dXJuIHRydWU7CisJfSBlbHNlIGlmIChjcHVfaGFzX2Zl
YXR1cmUoQ1BVX0ZUUl9BTFRJVkVDX0NPTVApKSB7CisJCXJldHVybiB0cnVlOworCX0gZWxzZSBp
ZiAoIWNwdV9oYXNfZmVhdHVyZShDUFVfRlRSX0ZQVV9VTkFWQUlMQUJMRSkpIHsKKwkJcmV0dXJu
IHRydWU7CisJfQorCisJcmV0dXJuIGZhbHNlOworfQorCitib29sIGtlcm5lbF9mcHVfZW5hYmxl
ZCh2b2lkKQoreworCXJldHVybiB0aGlzX2NwdV9yZWFkKGluX2tlcm5lbF9mcHUpOworfQorRVhQ
T1JUX1NZTUJPTF9HUEwoa2VybmVsX2ZwdV9lbmFibGVkKTsKKwordm9pZCBrZXJuZWxfZnB1X2Jl
Z2luKHZvaWQpCit7CisJaWYgKCFmcHVfc3VwcG9ydCgpKSB7CisJCVdBUk5fT05fT05DRSgxKTsK
KwkJcmV0dXJuOworCX0KKworCXByZWVtcHRfZGlzYWJsZSgpOworCisjaWZkZWYgQ09ORklHX1ZT
WAorCWlmIChjcHVfaGFzX2ZlYXR1cmUoQ1BVX0ZUUl9WU1hfQ09NUCkpIHsKKwkJZW5hYmxlX2tl
cm5lbF92c3goKTsKKwkJcmV0dXJuOworCX0KKyNlbmRpZgorCisjaWZkZWYgQ09ORklHX0FMVElW
RUMKKwlpZiAoY3B1X2hhc19mZWF0dXJlKENQVV9GVFJfQUxUSVZFQ19DT01QKSkgeworCQllbmFi
bGVfa2VybmVsX2FsdGl2ZWMoKTsKKwkJcmV0dXJuOworCX0KKyNlbmRpZgorCisjaWZkZWYgQ09O
RklHX1BQQ19GUFUKKwlpZiAoIWNwdV9oYXNfZmVhdHVyZShDUFVfRlRSX0ZQVV9VTkFWQUlMQUJM
RSkpIHsKKwkJZW5hYmxlX2tlcm5lbF9mcCgpOworCQlyZXR1cm47CisJfQorI2VuZGlmCit9CitF
WFBPUlRfU1lNQk9MX0dQTChrZXJuZWxfZnB1X2JlZ2luKTsKKwordm9pZCBrZXJuZWxfZnB1X2Vu
ZCh2b2lkKQoreworCWlmICghZnB1X3N1cHBvcnQoKSkgeworCQlXQVJOX09OX09OQ0UoMSk7CisJ
CXJldHVybjsKKwl9CisKKyNpZmRlZiBDT05GSUdfVlNYCisJaWYgKGNwdV9oYXNfZmVhdHVyZShD
UFVfRlRSX1ZTWF9DT01QKSkgeworCQlkaXNhYmxlX2tlcm5lbF92c3goKTsKKwkJZ290byBkb25l
OworCX0KKyNlbmRpZgorCisjaWZkZWYgQ09ORklHX0FMVElWRUMKKwlpZiAoY3B1X2hhc19mZWF0
dXJlKENQVV9GVFJfQUxUSVZFQ19DT01QKSkgeworCQlkaXNhYmxlX2tlcm5lbF9hbHRpdmVjKCk7
CisJCWdvdG8gZG9uZTsKKwl9CisjZW5kaWYKKworI2lmZGVmIENPTkZJR19QUENfRlBVCisJaWYg
KCFjcHVfaGFzX2ZlYXR1cmUoQ1BVX0ZUUl9GUFVfVU5BVkFJTEFCTEUpKSB7CisJCWRpc2FibGVf
a2VybmVsX2ZwKCk7CisJCWdvdG8gZG9uZTsKKwl9CisjZW5kaWYKKworZG9uZToKKwlwcmVlbXB0
X2VuYWJsZSgpOworfQorRVhQT1JUX1NZTUJPTF9HUEwoa2VybmVsX2ZwdV9lbmQpOworCiBzdGF0
aWMgdW5zaWduZWQgbG9uZyBtc3JfYWxsX2F2YWlsYWJsZTsKIAogc3RhdGljIGludCBfX2luaXQg
aW5pdF9tc3JfYWxsX2F2YWlsYWJsZSh2b2lkKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
