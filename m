Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6858BC907A
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36C56E160;
	Wed,  2 Oct 2019 18:16:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FF96E15C
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhjPanp46nV9mxPFByDMPrIYqGhbkH/eOgkSHByMBzTWAAhBDzg1r0+LZJGbMgZZs2vE8ztm/teOLukSTX+kooHrnIkLC7uQZMnfgs1w2py84XxZB/Id5RLAvbI6ECsqLC8cQwFPtyr0pskVnKdwJNBCf/uum9k3ZpCQdrztAa6UOOHOeKvuOBPiaDEXGmoEw3rQbhYez8bUnZmdMuF1ruTcJQbsgUeSfBvNkD4D29ZW1vTsyQgO1ia4+tjXdShFl+KUbIYIrL0rNeto/b3KT/GCu2cJ8mC3sUyZOfDqb1XT+ujKFUMyByDeA8R3PS/IUdGEoQpg/qtU1diF9XS2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48XJjsYxq84cgBIv1zCeiwWEbdg7N7o3vUh7Xp+dByY=;
 b=gP9TA2kfPY+m4Wjf6YK26gPmHp45Ym8/2PlauNQiSzOnPXsNLjKY8wK49AOxPr+RPIlRUxW0OcQJ5/YnuMYSnNvq560pn8R5kW6m8UrqCDz0CzsC/VGgrC3YVAfO8YgVdsYO3aTmjhyKvn7MDpPjd4cPF85t4OTt7bEzv+FFwXNm9R9DY6yF2tS5aVMLmDMa3bjys3T1qGM7t4dfha/OHUaYoW6B/I2I+dI0AzZtEio0vyxpidlFNzC5bjdxF2I9tK25HbDy9etsmABBkb4APVaKq7PXUbLjM5sZBY0A82Ok7tRdro8ExUOF8hxnmzDN4Hl63G3YQS7limSlJiLkRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0130.namprd12.prod.outlook.com (2603:10b6:0:51::26) by
 DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:35 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0130.outlook.office365.com
 (2603:10b6:0:51::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:35 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:35 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/38] DC Patches 02 Oct 2019
Date: Wed, 2 Oct 2019 14:15:55 -0400
Message-ID: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(428003)(189003)(199004)(51416003)(7696005)(26005)(316002)(8936002)(86362001)(50226002)(4326008)(2351001)(47776003)(16586007)(2906002)(48376002)(50466002)(70206006)(8676002)(53416004)(305945005)(81156014)(81166006)(2616005)(486006)(1076003)(336012)(426003)(70586007)(356004)(6666004)(186003)(14444005)(478600001)(36756003)(6916009)(476003)(5660300002)(126002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4090; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ff8445f-89b8-4d6d-cef7-08d74764a938
X-MS-TrafficTypeDiagnostic: DM6PR12MB4090:
X-Microsoft-Antispam-PRVS: <DM6PR12MB40906D861C08067DE28CE4F1F99C0@DM6PR12MB4090.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzNeBc0Zf1XgiLVxOIaBRJiuai1lMrfXE1jO5siBnbzMJACrOXhCu+yWiHeYjBmMHNDchbZidh+yLBETchmB+23X2WeJj4h/UdhjUmjQG0kXD0kSfdEkRu5U95Waa0CXa9RGOuHtjS+s/Pw3Fs77lcjb6zAdr7AobiItSR8F6fbWU+y9IUfoHw9tBJcMuRwJofjqU5DEyRMkRyFl0kS64d91Zp/iriAvN1SqMMvz0otCsM+CpkdXfCYcxCXV/VmP0ng+qigcfQfHj/I288uLOZmLhGIuIfvKiGUKDfOUm+u3NHNQecRhzwrcDmwDjE6XGRf2ZT2RogHBPGIcYP7G7wzhVcFsXUPTFU79OcuqKlYRvNA2GneAzzNj5a0wFj1BCceey8YuKmhYzS9xnzod6Un0/0nLo7xHR6Mo+1xA7DU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:35.6587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff8445f-89b8-4d6d-cef7-08d74764a938
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48XJjsYxq84cgBIv1zCeiwWEbdg7N7o3vUh7Xp+dByY=;
 b=SCeidEdhMKdN/QVt6IuL2qr2OuB8POFhY3SVtitTSRi9a5PVCjarLwsjhPjC/Mr1ybOKP1qW5ZIbzj/FgDtqKgfLp8Q1Rn9i8c04UfYKjhPmDpZxcftNR/Ywn34I53Z2R29IveuJqjBwJ1B7gk8VeiIw6uapQv3eto6t/V2N3ms=
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

U3VtbWFyeSBPZiBDaGFuZ2VzCipmaXggY29tcGlsZSB3YXJuaW5ncwoqZGNuMjEgZml4ZXMgKGF1
ZGlvLCBjbGtfbWdyKQoqRE1MIG91dHB1dCBjYWxjdWxhdGlvbnMgdXBkYXRlCgpBbnRob255IEtv
byAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiAzLjIuNTIKCkFyaWMgQ3lyICg0KToKICBkcm0vYW1k
L2Rpc3BsYXk6IFVwZGF0ZSBWX1VQREFURSB3aGVuZXZlciBWU1RBUlRVUCBjaGFuZ2VzCiAgZHJt
L2FtZC9kaXNwbGF5OiBQcm9wZXJseSByb3VuZCBub21pbmFsIGZyZXF1ZW5jeSBmb3IgU1BECiAg
ZHJtL2FtZC9kaXNwbGF5OiAzLjIuNTMKICBkcm0vYW1kL2Rpc3BsYXk6IDMuMi41NAoKQ2hhcmxl
bmUgTGl1ICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IHVzZSB2YmlvcyBtZXNzYWdlIHRvIGNhbGwg
c211IGZvciBkcG0gbGV2ZWwKCkRhdmlkIEdhbGlmZmkgKDEpOgogIGRybS9hbWQvZGlzcGxheTog
Rml4IGRvbmdsZV9jYXBzIGNvbnRhaW5pbmcgc3RhbGUgaW5mb3JtYXRpb24uCgpEbXl0cm8gTGFr
dHl1c2hraW4gKDIpOgogIGRybS9hbWQvZGlzcGxheTogZml4IHBpcGUgcmUtYXNzaWdubWVudCB3
aGVuIG9kbSBwcmVzZW50CiAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgcmVub2lyIHNwZWNpZmljIHdh
dGVybWFyayByYW5nZSBhbmQgY2xrIGhlbHBlcgoKRXJpYyBZYW5nICgzKToKICBkcm0vYW1kL2Rp
c3BsYXk6IGV4aXQgUFNSIGR1cmluZyBkZXRlY3Rpb24KICBkcm0vYW1kL2Rpc3BsYXk6IGZpeCBj
b2RlIHRvIGNvbnRyb2wgNDhtaHogcmVmY2xrCiAgZHJtL2FtZC9kaXNwbGF5OiBob29rIHVwIG5v
dGlmeSB3YXRlcm1hcmsgcmFuZ2VzIGFuZCBnZXQgY2xvY2sgdGFibGUKCkphZWh5dW4gQ2h1bmcg
KDEpOgogIGRybS9hbWQvZGlzcGxheTogQWRkIGNhcGFiaWxpdHkgY2hlY2sgZm9yIHN0YXRpYyBy
YW1wIGNhbGMKCkpvc2VwaCBHcmF2ZW5vciAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBmaXggaG90
cGx1ZyBkdXJpbmcgZGlzcGxheSBvZmYKICBkcm0vYW1kL2Rpc3BsYXk6IGFkZCBndWFyZCBmb3Ig
U01VIHZlciwgZm9yIDQ4bWh6IGNsawoKSm9zaHVhIEFiZXJiYWNrICgyKToKICBkcm0vYW1kL2Rp
c3BsYXk6IEFkZCBtaXNzaW5nIHNoaWZ0cyBhbmQgbWFza3MgZm9yIGRwcCByZWdpc3RlcnMgb24K
ICAgIGRjbjIKICBkcm0vYW1kL2Rpc3BsYXk6IFJlc3RvcmUgc2hvdWxkX3VwZGF0ZV9wc3RhdGVf
c3VwcG9ydCBhZnRlciBiYWQgcmV2ZXJ0CgpKb3NpcCBQYXZpYyAoMSk6CiAgZHJtL2FtZC9kaXNw
bGF5OiB3YWl0IGZvciBzZXQgcGlwZSBtY3AgY29tbWFuZCBjb21wbGV0aW9uCgpKdWxpYW4gUGFy
a2luICgyKToKICBkcm0vYW1kL2Rpc3BsYXk6IFJlcHJvZ3JhbSBGTVQgb24gcGlwZSBjaGFuZ2UK
ICBkcm0vYW1kL2Rpc3BsYXk6IFByb2dyYW0gRFdCIHdhdGVybWFya3MgZnJvbSBjb3JyZWN0IHN0
YXRlCgpKdW4gTGVpICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IGFkZCBleHBsaWNpdCBjb21wYXJh
dG9yIGFzIGRlZmF1bHQgb3B0aW1pemF0aW9uIGNoZWNrCgpMZW8gTGkgKDEpOgogIGRybS9hbWQv
ZGlzcGxheTogRml4IG1heWJlLXVuaW5pdGlhbGl6ZWQgd2FybmluZwoKTGV3aXMgSHVhbmcgKDEp
OgogIGRybS9hbWQvZGlzcGxheTogY2hlY2sgcGh5IGRwYWx0IGxhbmUgY291bnQgY29uZmlnCgpN
YXJ0aW4gTGV1bmcgKDEpOgogIGRybS9hbWQvZGlzcGxheTogYWRkIG1vcmUgY2hlY2tzIHRvIHZh
bGlkYXRlIHNlYW1sZXNzIGJvb3QgdGltaW5nCgpNaWNoYWVsIFN0cmF1c3MgKDEpOgogIGRybS9h
bWQvZGlzcGxheTogVXBkYXRlIG51bWJlciBvZiBkY24yMSBhdWRpbyBlbmRwb2ludHMKCk5pa29s
YSBDb3JuaWogKDEpOgogIGRybS9hbWQvZGlzcGxheTogQWRkIG91dHB1dCBiaXRyYXRlIHRvIERN
TCBjYWxjdWxhdGlvbnMKClJvYmluIFNpbmdoICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IEFkZGVk
IHBpeGVsIGR5bmFtaWMgZXhwYW5zaW9uIGNvbnRyb2wuCgpTaXZhcGlyaXlhbiBLdW1hcmFzYW15
ICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IGZpeCBidWcgd2l0aCBjaGVjayBmb3IgSFBEIExvdyBp
biB2ZXJpZnkgbGluayBjYXAKClN1bmcgTGVlICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IFNraXAg
RElHIENoZWNrIGlmIExpbmsgaXMgVmlydHVhbCBmb3IgRGlzcGxheSBDb3VudAoKVml0YWx5IFBy
b3N5YWsgKDEpOgogIGRybS9hbWQvZGlzcGxheTogYWRkIG5ldyBhY3RpdmUgZG9uZ2xlIHRvIGV4
aXN0ZW50IHcvYQoKV2F5bmUgTGluICg0KToKICBkcm0vYW1kL2Rpc3BsYXk6IENvcnJlY3QgdmFs
dWVzIGluIEFWSSBpbmZvZnJhbWUKICBkcm0vYW1kL2Rpc3BsYXk6IGFkZCBzdXBwb3J0IGZvciBW
U0lQIGluZm8gcGFja2V0CiAgZHJtL2FtZC9kaXNwbGF5OiBidWlsZCB1cCBWU0lGIGluZm9wYWNr
ZXQKICBkcm0vYW1kL2Rpc3BsYXk6IGNvcnJlY3Qgc3RyZWFtIExURV8zNDBNQ1NDX1NDUkFNQkxF
IHZhbHVlCgpXZW5qaW5nIExpdSAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBza2lwIGVuYWJsZSBz
dHJlYW0gb24gZGlzY29ubmVjdGVkIGRpc3BsYXkKCldlc2xleSBDaGFsbWVycyAoMSk6CiAgZHJt
L2FtZC9kaXNwbGF5OiBVc2UgZGNuMSBPcHRpbWFsIFRhcHMgR2V0CgpXeWF0dCBXb29kICgxKToK
ICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBMb2dnaW5nIGZvciBHYW1tYSBSZWxhdGVkIGluZm9ybWF0
aW9uCgpYaWFvZG9uZyBZYW4gKDEpOgogIGRybS9hbWQvZGlzcGxheTogbWFrZSBhdXggZGVmZXIg
ZGVsYXkgYW5kIGF1eCBzdyBzdGFydCBkZWxheSBzZXBlcmF0ZQoKIC4uLi9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8ICAxNiArKy0KIC4uLi9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jcmMuYyB8ICAgOSArLQogLi4uL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY2xrX21nci9jbGtfbWdyLmMgIHwgIDI1ICsrKysKIC4uLi9kaXNwbGF5L2RjL2Ns
a19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jICB8ICAyNCArKysrCiAuLi4vZGlzcGxheS9kYy9j
bGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuaCAgfCAgIDEgKwogLi4uL2FtZC9kaXNwbGF5L2Rj
L2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5jIHwgMTM1ICsrKysrKysrKysrKysrLS0tLQogLi4u
L2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21nci5oIHwgIDExICstCiAuLi4v
ZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jICAgfCAgMTkgKystCiAuLi4v
ZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5oICAgfCAgIDQgKy0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgICAgICB8ICA5NCArKysrKysrKysr
Ky0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyB8ICA0MyAr
KysrKy0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jICB8ICAz
MyArKysrLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYyAgIHwg
ICA0ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGMuaCAgICAgICAgICAgfCAg
MTcgKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfaHdfdHlwZXMuaCAgfCAg
IDUgKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX2xpbmsuaCAgICAgIHwgIDE3
ICsrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3N0cmVhbS5oICAgIHwgICAz
ICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jICB8ICAgMyAr
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYyAgfCAgMTEgKy0K
IC4uLi9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgICB8ICAxNiArLS0K
IC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2RwcC5jICB8ICAgNCArLQog
Li4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfZHBwLmggIHwgICA1ICsKIC4u
Li9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyB8ICAxNiArKy0KIC4u
Li9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9saW5rX2VuY29kZXIuaCB8ICAgMSArCiAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHAuYyAgfCAgIDMgKwogLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfb3B0Yy5jIHwgIDYwICsrLS0tLS0tCiAu
Li4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9vcHRjLmggfCAgIDUgKy0KIC4u
Li9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3N0cmVhbV9lbmNvZGVyLmMgICB8ICA2MiArKysrKysr
KwogLi4uL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfc3RyZWFtX2VuY29kZXIuaCAgIHwgICA1ICsK
IC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RwcC5jICB8ICA4NiArLS0t
LS0tLS0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHBwLmggIHwg
ICA1IC0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyAgICB8ICAz
OCArKysrLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfb3B0Yy5jIHwg
ICAyICstCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAg
MTQgKy0KIC4uLi9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3N0cmVhbV9lbmNvZGVyLmMgICB8ICAg
NCArCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMgfCAgMzIg
KysrLS0KIC4uLi9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3N0cnVjdHMuaCB8ICAg
MiArLQogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX3ZiYS5jIHwgICAy
ICsKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9kY19saW5rX2RwLmggICB8ICAgMyAr
CiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21nci5oICAgfCAgMTEgKy0K
IC4uLi9hbWQvZGlzcGxheS9kYy9pbmMvaHcvY2xrX21ncl9pbnRlcm5hbC5oICB8ICAyNSArKyst
CiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9saW5rX2VuY29kZXIuaCAgfCAgIDQgKwog
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9vcHAuaCAgIHwgICAxICsKIC4u
Li9hbWQvZGlzcGxheS9kYy9pbmMvaHcvc3RyZWFtX2VuY29kZXIuaCAgICB8ICAgNSArCiAuLi4v
YW1kL2Rpc3BsYXkvZGMvaW5jL2h3L3RpbWluZ19nZW5lcmF0b3IuaCAgfCAgIDIgKwogLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3X3NlcXVlbmNlci5oIHwgIDEzICstCiAuLi4vYW1k
L2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBlcy5oICAgfCAgIDIgKwogLi4uL2FtZC9k
aXNwbGF5L21vZHVsZXMvZnJlZXN5bmMvZnJlZXN5bmMuYyAgIHwgIDE3ICsrLQogLi4uL2FtZC9k
aXNwbGF5L21vZHVsZXMvaW5jL21vZF9pbmZvX3BhY2tldC5oIHwgICAzICsKIC4uLi9kaXNwbGF5
L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNrZXQuYyB8ICA5OCArKysrKysrKysrKysrCiA1
MCBmaWxlcyBjaGFuZ2VkLCA3NjYgaW5zZXJ0aW9ucygrKSwgMjU0IGRlbGV0aW9ucygtKQoKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
